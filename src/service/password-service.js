const jsonWebToken = require('jsonwebtoken');
const { Util, Connection } = require('stashook-utils');
const bcryptjs = require('bcryptjs');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');
const UsersModel = require('../model/users');
const otpGenerator = require('otp-generator')
const moment = require('moment');
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    host: process.env.EMAIL_SMTP_HOST,
    service: process.env.EMAIL_SMTP_SERVICE,
    port: process.env.EMAIL_SMTP_PORT,
    secure: true,
    auth: {
        user: process.env.ADMIN_EMAIL_ID,
        pass: process.env.ADMIN_EMAIL_PASSWORD,
    },

});

module.exports = {
    changePassword: async function (req, res, next) {

        Logger.info("ChangePassword Query ::: " + Queries.ChangePassword);

        if (req.body.password && validateOTP(req)) {

            bcryptjs.genSalt(10, function (error, Salt) {
                bcryptjs.hash(req.body.password, Salt, function (hashError, hashedPassword) {

                    if (hashError)
                        Logger.error("ChangePassword:::hashError::: " + hashError);
                    else {
                        Logger.info("ChangePassword:::hashedPassword::: " + hashedPassword);
                        Connection.query(Queries.ChangePassword, UsersModel.updateData(req, hashedPassword), function (error, results) {
                            if (error || !results || results.affectedRows === 0) res.json(Message.USER_PASSWORD_FAILED);
                            else res.json(Message.USER_PASSWORD_CHANGED_SUCCESSFULLY);
                        });
                    }
                });
            });
        }
        else {
            res.json(Message.USER_PASSWORD_CHANGE_FAILED);
        }

    },

    forgotPassword: async function (req, res, next) {

        Logger.info("ForgotPassword Query ::: " + Queries.LoginAuthenticate);

        const emailId = req.body.emailId;

        //Using Same LoginAuthenticate Query 
        Connection.query(Queries.LoginAuthenticate, [emailId, emailId, emailId], function (lError, results) {

            if (lError === null && results && results.length > 0) {

                let otpPasswordToken = createPasswordToken(results[0]);

                transporter.sendMail(mailOptions(otpPasswordToken[0]), function (error, info) {

                    if (error) {
                        res.json(Message.USER_PASSWORD_UNABLE_SEND_EMAIL);
                    } else {
                        let passwordToken = jsonWebToken.sign(otpPasswordToken[0], process.env.ACCESS_TOKEN, createSignInOptions());  //Eg: 60, "2 days", "10h", "7d"

                        res.status(200).send({
                            passwordtoken: passwordToken,
                            firstPart: otpPasswordToken[1],
                            message: Message.USER_PASSWORD_TOKEN_SEND_TO_EMAIL_ID
                        });
                        res.end();
                    }
                });
            }
            else {
                Util.sendError401(res, Message.USER_PASSWORD_GENERATION_FAILED);
            }
        });
    },

}

function validateOTP(req) {
    let tokenTime = moment(req.sessionUser.createdTime, "YYYY-MM-DD HH:mm:ss");
    let currentTime = moment(Date.now()).add(90000, 'seconds').format("YYYY-MM-DD HH:mm:ss");
    //let currentTime = moment(Date.now()).format("YYYY-MM-DD HH:mm:ss") ;
    currentTime = moment(currentTime, "YYYY-MM-DD HH:mm:ss");

    let difference = currentTime.diff(tokenTime, 'seconds');

    return (req.body.otp === req.sessionUser.otp && difference < process.env.PASSWORD_TOKEN_EXPIRES_IN);
}

function createSignInOptions() {
    //console.log(":::::process.env.ACCESS_TOKEN_EXPIRES_IN::::: " + process.env.ACCESS_TOKEN_EXPIRES_IN);
    return { expiresIn: process.env.PASSWORD_TOKEN_EXPIRES_IN };
}

function createPasswordToken(user) {
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


function mailOptions(user) {
    let expiresIn = millisToMinutesAndSeconds(process.env.PASSWORD_TOKEN_EXPIRES_IN);
    return {
        from: `"${process.env.ADMIN_EMAIL_DISPLAY_NAME}" <${process.env.ADMIN_EMAIL_ID}>` ,
        to: user.emailId,
        subject: `${process.env.APPLICATION} Application Password Reset Email OTP Code`,
        html: `<HTML><BODY><BR>Hi ${user.userName},<BR><BR>Your Password Change Activation Code Is <B>${user.otp}</B>. 
        <BR>Your Activation Code Will Expire In ${expiresIn} minutes.<BR><BR>Thanks,<BR>Administrator.</BODY></HTML>`
    };
}

function millisToMinutesAndSeconds(millis) {
    var minutes = Math.floor(millis / 60000);
    var seconds = ((millis % 60000) / 1000).toFixed(0);
    return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
}