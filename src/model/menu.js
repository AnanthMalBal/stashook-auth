const {Util, Model } = require('stashook-utils');

module.exports = new class MenuModel extends Model {

  constructor() {
    super('menu'); // Table Name
  }

  searchData(req) {

    let searchData = [];

    searchData.push(req.body.roles.split(","));

    return searchData;
  }
}
