const { Util } = require('stashook-utils');
const Message = require('../util/message');
const loginService = require('../service/login-service');
const userService = require('../service/user-service');

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
            Util.sendError500(req, res, excep);
        }
    },

    getUser: async function (req, res, next) {
        try {
            userService.getUser(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },


}