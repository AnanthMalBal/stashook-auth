const jsonWebToken = require('jsonwebtoken');
const { Util, Connection } = require('stashook-utils');
const bcryptjs = require('bcryptjs');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');
const UsersLogModel = require('../model/userslog');
const { error } = require('winston');

module.exports = {
    generateAccessToken: async function (req, res, next) {

        Logger.info("Authenitcate Query ::: " + Queries.LoginAuthenticate);

        const loginId = req.body.username;
        const password = req.body.password;

        Connection.query(Queries.LoginAuthenticate, [loginId, loginId, loginId], function (err, results) {
            
            if (err === null && results[0] !== undefined) {
                bcryptjs.compare(password, results[0].userPwd).then(match => {

                    if (match) {

                        Connection.query(Queries.UserRolesSelect, [results[0].employeeId], function (err, roleResults) {

                            UsersLogModel.create(UsersLogModel.createData(results));
                            let roleData = getRolesInfo(roleResults);
                            let accessToken = jsonWebToken.sign(createTokenData(results[0], roleData), process.env.ACCESS_TOKEN, createSignInOptions());  //Eg: 60, "2 days", "10h", "7d"

                            res.status(200).send({
                                accesstoken: accessToken,
                                user: {
                                    userId: results[0].userId,
                                    userName: results[0].userName,
                                    emailId: results[0].emailId,
                                    leadBy: results[0].leadBy,
                                    producerName: results[0].producerName,
                                    isAdmin: roleData.isAdmin,
                                    roles: roleData.roles

                                },
                                message: Message.USER_LOGGED_IN_SUCCESSFULLY
                            });
                            res.end();
                        });
                    } else {
                        Util.sendError401(res, Message.USER_LOGGED_IN_FAILED);
                    }
                });
            } else {
                Util.sendError401(res, Message.USER_NOT_FOUND);
            }
        });
    }
}

function createSignInOptions() {
    //console.log(":::::process.env.ACCESS_TOKEN_EXPIRES_IN::::: " + process.env.ACCESS_TOKEN_EXPIRES_IN);
    return { expiresIn: process.env.ACCESS_TOKEN_EXPIRES_IN };
}

function createTokenData(user, roleData) {

    return {
        employeeId: user.employeeId,
        userId: user.userId,
        userName: user.userName,
        emailId: user.emailId,
        producerId: user.producerId,
        producerName: user.producerName,
        userType: user.userType,
        reportingTo: user.reportingTo,
        roles: roleData.roles,
        isAdmin: roleData.isAdmin
    }
}


function getRolesInfo(roleResults) {
    let isAdmin = false;
    let roles = [];

    roleResults.forEach(element => {
        if (element.isAdmin && !isAdmin)
            isAdmin = true;
        roles.push(element.roleId);
    });
    return { roles, isAdmin };
}

