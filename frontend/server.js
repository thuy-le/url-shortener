var express = require('express');
var path = require('path');
var app = express();
var args = process.argv.slice(2);

app.use('/', express.static('.'));

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/index.html'));
});

app.listen(args[0]);