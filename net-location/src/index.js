var express = require('express');

// Constants
var PORT = 8080;

// App
var app = express();
app.get('/', function (req, res) {
  res.send('NODEJS: Hello world from IP: ' + req.socket.localAddress + ':' + PORT + '\n');
  console.log("Responded to request from " + req);
});

app.listen(PORT);
console.log(new Date() + ' Running on http://TBD:' + PORT);
