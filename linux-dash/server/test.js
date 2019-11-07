
const express = require('express')
const http = require('http')
const app = express()
const port = 8000

app.get('/', (req, res) => {
    res.send('Hello World! \n');
    str = JSON.stringify(app);
    res.send(str);
    res.end();
});

var server = http.createServer(app);
server.listen(port, "0.0.0.0");
console.log(`Example app listening on port ${port}. Press Ctrl+C to stop\n`);

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
