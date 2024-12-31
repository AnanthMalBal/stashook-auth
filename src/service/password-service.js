const jsonWebToken = require('jsonwebtoken');
const { Util, Connection, Logger, EmailService } = require('stashook-utils');
const bcryptjs = require('bcryptjs');
const Queries = require('../util/queries');
const Message = require('../util/message');
const UsersModel = require('../model/users');
const otpGenerator = require('otp-generator')
const moment = require('moment');

module.exports = {
    changePassword: async function (req, res, next) {

        Logger.info("ChangePassword Query ::: " + Queries.ChangePassword);

        if (req.body.password && validateOTP(req)) {

            bcryptjs.genSalt(10, function (error, Salt) {
                bcryptjs.hash(req.body.password, Salt, function (hashError, hashedPassword) {

                    if (hashError) {
                        Logger.error("ChangePassword:::hashError::: " + hashError);
                        res.json(Message.UNABLE_TO_CHANGE_USER_PASSWORD);
                    }
                    else {
                        Logger.info("ChangePassword:::hashedPassword::: " + hashedPassword);
                        Connection.query(Queries.ChangePassword, UsersModel.updateData(req, hashedPassword), function (error, results) {
                            if (error || !results || results.affectedRows === 0) res.json(Message.UNABLE_TO_CHANGE_USER_PASSWORD);
                            else res.json(Message.USER_PASSWORD_CHANGED_SUCCESSFULLY);
                        });
                    }
                });
            });
        }
        else {
            res.json(Message.UNABLE_TO_CHANGE_INVALID_EXPIRE_OTP);
        }

    },

    forgotPassword: async function (req, res, next) {

        Logger.info("ForgotPassword Query ::: " + Queries.LoginAuthenticate);

        const emailId = req.body.emailId;

        //Using Same LoginAuthenticate Query 
        Connection.query(Queries.LoginAuthenticate, [emailId, emailId, emailId], function (lError, results) {

            if (lError === null && results && results.length > 0) {

                let userToken = createUserTokenData(results[0]);

                req.body.config = {};
                req.body.config.key = 'ChangePassword'; //Key For ProducerProperty Table Config Cache
                req.body.config.property = 'SupportEmail'; //Email Configuration
                req.body.email = {};
                req.body.messageId = 'User_Change_Password'; //Key For Messages Table
                req.body.email.to = userToken[0].emailId; //Recipetant Email Id
                req.body.email.keyBaseName = ''; // Start Key For Data Map
                //Email/SMS/WhatsApp Template need dataMap to render message with data
                req.body.email.dataMap = {
                    "expiresIn": millisToMinutesAndSeconds(process.env.PASSWORD_TOKEN_EXPIRES_IN),
                    "user": userToken[0]
                };

                //Trigger Email 
                EmailService.sendEmail(req, res, next);

                let passwordToken = jsonWebToken.sign(userToken[0], process.env.ACCESS_TOKEN, createSignInOptions());  //Eg: 60, "2 days", "10h", "7d"

                res.status(200).send({
                    passwordtoken: passwordToken,
                    firstPart: userToken[1],
                    expiresInMinutes: millisToMinutesAndSeconds(process.env.PASSWORD_TOKEN_EXPIRES_IN),
                    message: Message.USER_PASSWORD_TOKEN_SEND_TO_EMAIL_ID
                });
                res.end();
            }
            else {
                Util.sendError401(res, Message.USER_PASSWORD_INVALID_USER);
            }
        });
    },

}

function validateOTP(req) {

    if (req.body.otp === undefined && req.sessionUser.otp === undefined) { //With Logged In Change Password
        return true;
    }
    else if (req.body.otp && req.sessionUser.otp) {
        let tokenTime = moment(req.sessionUser.createdTime, "YYYY-MM-DD HH:mm:ss");
        let currentTime = moment(Date.now()).add(90000, 'seconds').format("YYYY-MM-DD HH:mm:ss");
        currentTime = moment(currentTime, "YYYY-MM-DD HH:mm:ss");

        let difference = currentTime.diff(tokenTime, 'seconds');

        return (req.body.otp === req.sessionUser.otp && difference < process.env.PASSWORD_TOKEN_EXPIRES_IN);
    }
    else
        return false;
}

function createSignInOptions() {
    //console.log(":::::process.env.ACCESS_TOKEN_EXPIRES_IN::::: " + process.env.ACCESS_TOKEN_EXPIRES_IN);
    return { expiresIn: process.env.PASSWORD_TOKEN_EXPIRES_IN };
}

function createUserTokenData(user) {
    let first3Part = otpGenerator.generate(3, { digits: false, lowerCaseAlphabets: false, upperCaseAlphabets: true, specialChars: false }) + '-';
    let last6Part = otpGenerator.generate(6, { digits: true, lowerCaseAlphabets: false, upperCaseAlphabets: false, specialChars: false });

    let oneTimePassword = first3Part + last6Part;

    return [{
        userName: user.userName,
        employeeId: user.employeeId,
        emailId: user.emailId,
        otp: oneTimePassword,
        createdTime: moment(Date.now()).format("YYYY-MM-DD-HH:mm:ss")
    }, first3Part];
}

function millisToMinutesAndSeconds(millis) {
    var minutes = Math.floor(millis / 60000);
    var seconds = ((millis % 60000) / 1000).toFixed(0);
    return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
}
