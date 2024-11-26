const { Util } = require('stashook-utils');
const menuService = require('../service/menu-service');

module.exports = {
    getMenuList: async function (req, res, next) {
        try {
            menuService.getMenuList(req, res, next);
        }
        catch (excep) {
            console.log("getMenuList excep ::: " + excep);
            Util.sendError500(req, res, excep);
        }
    },

}