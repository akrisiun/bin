#!/usr/bin/env node
// node ./linux-dash/server/index.js

const express = require('express')
const http  = require('http')
const path    = require('path')
const spawn   = require('child_process').spawn
var fs      = require('fs')
var ws      = require('websocket').server
var args    = require('yargs').argv
var port    = args.port || process.env.LINUX_DASH_SERVER_PORT || 8000
// const server  = http.Server(app)

var app    = express();
var server = http.Server(app);
var verbose = 2;
server.listen(port, "0.0.0.0");

/* // Tcp6 :-(
server.listen(port, function() {
  console.log('Linux Dash server Started on port ' + port + '!');
}) */

app.use(express.static(path.resolve(__dirname + '/../')))

app.get('/', function (req, res) {
  if (verbose >= 2)
      console.log("req", req);
	res.sendFile(path.resolve(__dirname + '/../index.html'))
})

app.get('/websocket', function (req, res) {

  res.send({
    websocket_support: true,
  })

})

wsServer = new ws({
	httpServer: server
})

var nixJsonAPIScript = __dirname + '/linux_json_api.sh'

function getPluginData(pluginName, callback) {
  var command = spawn(nixJsonAPIScript, [ pluginName, '' ])
  var output  = []

  command.stdout.on('data', function(chunk) {

    console.log(chunk.toString())
    output.push(chunk.toString())
  })

  command.on('close', function (code) {
    callback(code, output)
  })
}

wsServer.on('request', function(request) {

	var wsClient = request.accept('', request.origin)

  wsClient.on('message', function(wsReq) {

    var moduleName = wsReq.utf8Data
    var sendDataToClient = function(code, output) {
      if (code === 0) {
        var wsResponse = '{ "moduleName": "' + moduleName + '", "output": "'+ output.join('') +'" }'
        wsClient.sendUTF(wsResponse)
      }
    }

    getPluginData(moduleName, sendDataToClient)

  })

})

app.get('/server/', function (req, res) {

	var respondWithData = function(code, output) {
		if (code === 0) res.send(output.toString())
		else res.sendStatus(500)
	}

  getPluginData(req.query.module, respondWithData)
})

console.log(`Linux Dash server listening on port ${port}. Press Ctrl+C to stop\n`);

const wait = function () {
  process.on('SIGINT', function () {
    console.log(' http-server stopped.');
    process.exit();
  });
  process.on('SIGTERM', function () {
    console.log(' http-server stopped.');
    process.exit();
  });
}

wait();
