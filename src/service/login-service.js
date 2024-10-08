const jsonWebToken = require('jsonwebtoken');
const { Util, Connection } = require('stashook-utils');
const bcryptjs = require('bcryptjs');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersLogModel = require('../model/userslog');

const AUTHORIZATION = 'authorization';
const APPLICATION_JSON = 'application/json';
const ORIGIN = ' <origin>';
module.exports = {
    authenticate: async function (req, res, next) {

        console.log("Authenitcate Query ::: " + Queries.LoginAuthenticate);

        const loginId = req.body.username;
        const password = req.body.password;

        Connection.query(Queries.LoginAuthenticate, [loginId, loginId, loginId], function (err, results) {

            if (err === null && results[0] !== undefined) {
                bcryptjs.compare(password, results[0].userPwd).then(match => {

                    if (match) {

                        UsersLogModel.create(UsersLogModel.createData(results));

                        let accessToken = jsonWebToken.sign({ loginId: loginId, password }, process.env.ACCESS_TOKEN);

                        res.status(200).send({
                            accesstoken: accessToken,
                            employeeId: results[0].employeeId,
                            message: Message.USER_LOGGED_IN_SUCCESSFULLY
                        });
                        res.end();
                    } else {
                        Util.sendError401(res, Message.USER_LOGGED_IN_FAILED);
                    }
                });
            } else {
                Util.sendError401(res, Message.USER_NOT_FOUND);
            }
        });
    },

    validateAuthToken: async function (req, res, next) {
        headers = {

            'Content-Type': APPLICATION_JSON,
            "Access-Control-Allow-Origin": ORIGIN,
            "Access-Control-Allow-Credentials": true
        };

        const authHeader = req.headers[AUTHORIZATION];
        const token = authHeader && authHeader.split(" ")[1];

        if (!token) return Util.sendError401(res);

        jsonWebToken.verify(token, process.env.ACCESS_TOKEN, (err, obj) => {

            console.log("Authenticate Token Successfully :::");

            if (err) return Util.sendError401(res);

            req.username = obj.username;
            req.password = obj.password;
            next();
        })
    }
}


