const express = require('express');
const MenuController = require('../controller/menu-controller');

const router = express.Router();

router.post('/menuList', MenuController.getMenuList);

module.exports = router;