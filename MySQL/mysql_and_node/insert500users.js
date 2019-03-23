var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host: '192.168.99.100',
	user: 'anisaha',
	password: 'mypass',
	database: 'mysql_node_app'
});

connection.connect();

var data = [];
for(let i = 0; i< 500; i++)
	data.push([faker.internet.email(), faker.date.past()]);
	
var insertQ = "insert into users (email, created_at) values ?";

//console.log(data);
connection.query(insertQ, [data], function(err, results){
	if(err)
		throw err;
	
	console.log(results);
});

connection.end();