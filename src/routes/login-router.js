const express = require('express');
const LoginController = require('../controller/login-controller');
const PasswordController = require('../controller/password-controller');
const {AuthToken} = require('stashook-utils');
const router = express.Router();

router.post('/login', LoginController.authenticate);

router.post('/changePassword', AuthToken.validateToken, PasswordController.changePassword);

module.exports = router;