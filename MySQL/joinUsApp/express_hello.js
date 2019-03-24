var express = require('express');
var app = express();

app.get('/', function(req, res){
	res.send("Hello from the web app!");
});

app.listen('8080', function(){
	console.log('App listenenig in port 8080');
});