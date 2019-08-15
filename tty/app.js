// $ npm install tty.js

// tty.js is an app, but it's also possible to hook into it programatically.
var tty = require('tty.js'); // 'ttyx'); // tty.js');
var config = require('./config');

var app = tty.createServer({
  shell: 'bash',
  users: {
    foo: 'bar'
  },
  port: 3001
});

app.get('/foo', function(req, res, next) {
  res.send('bar');
});

app.listen();