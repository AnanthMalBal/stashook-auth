const { Util, Connection } = require('stashook-utils');
const bcryptjs = require('bcryptjs');
const Queries = require('../util/queries');
const Message = require('../util/message');
const Logger = require('../util/logger');
const UsersModel = require('../model/users');

module.exports = {
    changePassword: async function (req, res, next) {

        Logger.info("ChangePassword Query ::: " + Queries.ChangePassword);

        if (req.body.password) {

            let hashedPassword = '';

            bcryptjs.genSalt(10, function (error, Salt) {
                bcryptjs.hash(req.body.password, Salt, function (hashError, hashResult) {

                    if (hashError)
                        Logger.error("ChangePassword:::hashError::: " + hashError);
                    else {
                        Logger.info("ChangePassword:::hashedPassword::: " + hashResult);
                        Connection.query(Queries.ChangePassword, UsersModel.updateData(req, hashResult), function (error, results) {
                            if (error || !results || results.affectedRows === 0) res.json(Message.USER_PASSWORD_FAILED);
                            else res.json(Message.USER_PASSWORD_CHANGED_SUCCESSFULLY);
                        });
                    }
                });
            });
        }
        else
            res.json(Message.USER_PASSWORD_FAILED);

    }

}