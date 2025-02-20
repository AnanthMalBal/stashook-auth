var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var loginRouter = require('./src/routes/login-router');
var menuRouter = require('./src/routes/menu-router');

var app = express();

// view engine setup
// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

const CONTEXT_PATH = '/stashook';

app.use(CONTEXT_PATH, loginRouter);
app.use(CONTEXT_PATH, menuRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

const cors = require('cors');
const allowedOrigins = ['http://localhost:3007' ,'http://localhost:4200','http://localhost:9000','http://192.168.31.45:9000'];
// const origin = (whitelist.indexOf(req.header('Origin')) !== -1); // Newly Added
// const options=cors.CorsOptions= {  origin: origin}; // Newly Added
const options=cors.CorsOptions= {  origin: allowedOrigins};
app.use(cors(allowedOrigins));
app.use(cors(options));
app.use(cors({
  origin: '*'
}));


// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
