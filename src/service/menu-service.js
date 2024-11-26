const { Connection } = require('stashook-utils');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');
const MenuModel = require('../model/menu');


module.exports = {
    getMenuList: async function (req, res, next) {

        Logger.info("Menu List Query ::: " + Queries.MenuSelect);

        if (req.body.roleList && req.body.roleList.length > 0) {

            Connection.query(Queries.MenuSelect, MenuModel.searchData(req), function (error, results) {
                if (error) res.json("[]");
                res.json(results);
            });
        }
        else
            res.json("[]");

    }

}