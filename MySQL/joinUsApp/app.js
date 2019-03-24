var express = require('express');
var faker = require('faker');
var mysql = require('mysql');
var bodyParser = require('body-parser');

var app = express();
app.set('view engine', 'ejs');
app.set('views', __dirname+'/views');
app.use(express.static(__dirname+"/public"));
app.use(bodyParser.urlencoded({extended: true}));

var connection = mysql.createConnection({
	host: '192.168.99.100',
	user: 'anisaha',
	password: 'mypass',
	database: 'mysql_node_app'
});

connection.connect();

app.get('/', function(req, res){
	const query = 'Select count(*) as count from users';
	connection.query(query, function(err, results){
		if(err)
			throw err;
		
		var count = results[0].count;
		//res.send("We have "+count+" users in our db");
		res.render("home", {data: count});
	});
});

app.post('/register', function(req, res){
	var person = {email: req.body.email};
	connection.query('insert into users set ?', person, function(error, results){
		if(error)
			throw error;
		
		//console.log(results);
		//res.send("Thanks for joining our waitlist!");
		res.redirect("/");
	});
});

//connection.end();

app.listen('8080', function(){
	console.log('App listenenig in port 8080');
});

