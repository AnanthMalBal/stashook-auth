const {Util, Model} = require('stashook-utils');

module.exports = new class UsersModel extends Model {

  constructor() {
    super('users');// Table Name
  }

  updateData(req, hashedPassword) {

    let updateData = [];
    updateData.push(hashedPassword);
    updateData.push(Util.getDate());
    updateData.push(req.sessionUser.employeeId);

    return updateData;
  }

}