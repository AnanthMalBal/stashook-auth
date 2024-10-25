const {Util} = require('stashook-utils');
const Message = require('../util/message');
const loginService = require('../service/login-service');
const { error } = require('winston');

module.exports = {
    authenticate: async function (req, res, next) {
        try {

            if (req.body.username && req.body.password) {
                loginService.generateAccessToken(req, res, next);
            }
            else {

                Util.sendError401(res, Message.USER_LOGGED_IN_FAILED);
                
            }
        }
        catch (excep) {
            console.log("Authenitcate excep ::: " + excep);
            Util.sendError500(req, res, excep);
        }
    },
    
}