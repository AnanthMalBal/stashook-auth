const { Util } = require('stashook-utils');
const passwordService = require('../service/password-service');

module.exports = {

    changePassword: async function (req, res, next) {
        try {

            passwordService.changePassword(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

    forgotPassword: async function (req, res, next) {
        try {

            passwordService.forgotPassword(req, res, next);
        }
        catch (excep) {
            Util.sendError500(req, res, excep);
        }
    },

}