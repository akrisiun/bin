var http = require('http');

var express = require('express');
var app = express();
var expressWs = require('express-ws')(app);
var os = require('os');
var pty = require('node-pty');

var terminals = {},
    logs = {};

app.use('/build', express.static(__dirname + '/../build'));

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

/*
import * as Terminal from './build/xterm';
import * as attach from './build/addons/attach/attach';
import * as fit from './build/addons/fit/fit';
import * as fullscreen from './build/addons/fullscreen/fullscreen';
import * as search from './build/addons/search/search';
import * as winptyCompat from './build/addons/winptyCompat/winptyCompat';

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('Hello, world! [helloworld sample; iisnode version is ' 
        + process.env.IISNODE_VERSION + ', node version is ' + process.version + ']');
        
}).listen(process.env.PORT);

*/

app.get('/style.css', function(req, res){
  res.sendFile(__dirname + '/style.css');
});

app.get('/dist/bundle.js', function(req, res){
  res.sendFile(__dirname + '/dist/bundle.js');
});

app.get('/dist/bundle.js.map', function(req, res){
  res.sendFile(__dirname + '/dist/bundle.js.map');
});

app.post('/terminals', function (req, res) {

  var cols = 120,
      rows = 24;

  if (req.query.cols) {
      cols = parseInt(req.query.cols),
      rows = parseInt(req.query.rows);
  }
      
  var term = pty.spawn(process.platform === 'win32' ? 'cmd.exe' : 'bash', [], {
        name: 'xterm-color',
        cols: cols || 80,
        rows: rows || 24,
        cwd: process.env.PWD,
        env: process.env
      });

  console.log('Created terminal with PID: ' + term.pid);
  terminals[term.pid] = term;
  logs[term.pid] = '';
  term.on('data', function(data) {
    logs[term.pid] += data;
  });
  res.send(term.pid.toString());
  res.end();
});

app.post('/terminals/:pid/size', function (req, res) {
  var pid = parseInt(req.params.pid),
      cols = parseInt(req.query.cols),
      rows = parseInt(req.query.rows),
      term = terminals[pid];

  term.resize(cols, rows);
  console.log('Resized terminal ' + pid + ' to ' + cols + ' cols and ' + rows + ' rows.');
  res.end();
});

app.ws('/terminals/:pid', function (ws, req) {
  var term = terminals[parseInt(req.params.pid)];
  console.log('Connected to terminal ' + term.pid);
  ws.send(logs[term.pid]);

  term.on('data', function(data) {
    try {
      ws.send(data);
    } catch (ex) {
      // The WebSocket is not open, ignore
    }
  });
  ws.on('message', function(msg) {
    term.write(msg);
  });
  ws.on('close', function () {
    term.kill();
    console.log('Closed terminal ' + term.pid);
    // Clean things up
    delete terminals[term.pid];
    delete logs[term.pid];
  });
});

var port = process.env.PORT || 3001,
    host = os.platform() === 'win32' ? '127.0.0.1' : '0.0.0.0';

port = 3001;
console.log('App listening to http://' + host + ':' + port);
app.listen(port, host);

