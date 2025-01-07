const {Util, Model} = require('stashook-utils');

module.exports = new class UsersLogModel extends Model {

  constructor() {
    super('users_log'); // Table Name
  }

  createData(results) {
    return { 
      'employeeId': results[0].employeeId, 
      'userLoginTime': Util.getDate(), 
      'fetchBlock': 1 
    }
  }
}