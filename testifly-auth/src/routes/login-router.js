const express = require('express');
const LoginController = require('../controller/login-controller');

const router = express.Router();

const cors =require('cors');
var whitelist = ['http://localhost:4200','http://localhost:4350']
let corsOptionsDelegate = function (req, callback) {
  var corsOptions;
  if (whitelist.indexOf(req.header('Origin')) !== -1) {
    corsOptions = { origin: true } // reflect (enable) the requested origin in the CORS response
  } else {
    corsOptions = { origin: false } // disable CORS for this request
  }
  callback(null, corsOptions) // callback expects two parameters: error and options
}
router.options('*',cors());



router.post('/login', cors(corsOptionsDelegate),LoginController.authenticate);



module.exports = router;