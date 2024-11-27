const express = require('express');
const {AuthToken} = require('stashook-utils');
const MenuController = require('../controller/menu-controller');

const router = express.Router();

router.post('/menuList', AuthToken.validateToken, MenuController.getMenuList);

module.exports = router;