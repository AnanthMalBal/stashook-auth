const { Connection, Logger } = require('stashook-utils');
const Queries = require('../util/queries');
const MenuModel = require('../model/menu');

module.exports = {
    getMenuList: async function (req, res, next) {

        Logger.info("Menu List Query ::: " + Queries.MenuSelect);

        if (req.body.roles && req.body.roles.length > 0) {

            Connection.query(Queries.MenuSelect, MenuModel.searchData(req), function (error, results) {
                if (error) res.json("[]");
                res.json(results);
            });
        }
        else
            res.json("[]");

    }

}