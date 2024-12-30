const { Util, Connection } = require('stashook-utils');
const Queries = require('../util/queries');
const Logger = require('../util/logger');
const { error } = require('winston');

module.exports = {
    getUser: async function (req, res, next) {
        Logger.info("GetUser Query ::: " + Queries.GetUser);

        if (req.sessionUser.employeeId) {

            Connection.query(Queries.GetUser, [req.sessionUser.employeeId], function (error, results) {
                if (error === null && results !== undefined && results.length > 0) 
                    res.json(results[0]);
                else
                    res.json("{}");
                  
            });
        }
        else
            res.json("{}");
    }
}