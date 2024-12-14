const { Util } = require('stashook-utils');
const Message = require('../util/message');
const loginService = require('../service/login-service');
const passwordService = require('../service/password-service');

module.exports = {

    changePassword: async function (req, res, next) {
        try {

            passwordService.changePassword(req, res, next);
        }
        catch (excep) {
            console.log("Change Password excep ::: " + excep);
            Util.sendError500(req, res, excep);
        }
    },

    forgotPassword: async function (req, res, next) {
        try {

            passwordService.forgotPassword(req, res, next);
        }
        catch (excep) {
            console.log("Forgot Password excep ::: " + excep);
            Util.sendError500(req, res, excep);
        }
    },

}