var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host: '192.168.99.100',
	user: 'anisaha',
	password: 'mypass',
	database: 'mysql_node_app'
});

connection.connect();

var query = "Select curdate() as solution";
var query2 = "select curtime() as time, curdate() as date, now() as now";
connection.query(query2, function(error, results, fields){
	if(error)
		throw error;
	
	console.log('The solution is: '+results[0].solution);
	console.log(results);
});

const query3 = "select * from users"
connection.query(query3, function(error, results, fields){
	if(error)
		throw error;
	
	console.log(results);
});

var person = {email: faker.internet.email()};
connection.query('insert into users set ?', person, function(error, results){
	if(error)
		throw error;
	
	console.log(results);
});

var person2 = {email: faker.internet.email(), created_at: faker.date.past()};
var result = connection.query('insert into users set ?', person2, function(error, results){
	if(error)
		throw error;
	
	console.log(results);
});

console.log(result.sql);

connection.end();