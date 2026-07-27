PRG1--- INTRO TO NODE.JS

const http = require('http');
// Creating server
const server = http.createServer((req, res) => {
// Setting response header

res.writeHead(200, {'Content-Type':'text/plain'});
// Handling different routes
if(req.url === '/'){
res.write("Welcome to Node.js Server");
}
else if(req.url === '/about'){
res.write("This is About Page");
}
else{
res.write("Page Not Found");
}
// Ending response
res.end();
});
// Listening on port
server.listen(3000, () => {
console.log("Server running at http://localhost:3000");
});


PRG2----- EXPRESS AND ROUTING

const express = require('express');
const app = express();
// Home Route
app.get('/', (req, res) => {
res.send("Welcome to Express Home Page");
});
// About Route
app.get('/about', (req, res) => {
res.send("About Page - Express Framework");
});
// Contact Route
app.get('/contact', (req, res) => {
res.send("Contact Page");
});
// Handling unknown routes
app.use((req, res) => {
res.status(404).send("Page Not Found");
});
// Starting server
app.listen(3000, () => {
console.log("Express server running on port 3000");
});


PRG3 ---MIDDLEWARE IN EXPRESS

const express = require('express');
const app = express();
// Custom Middleware
app.use((req, res, next) => {
console.log("Request Method:", req.method);
console.log("Request URL:", req.url);
next();
});
// Route

app.get('/', (req, res) => {
res.send("Middleware Example");
});
app.listen(3000, () => {
console.log("Server running...");
});


PRG4 ---- REST API USING EXPRESS 

const express = require('express');
const app = express();
app.use(express.json());
// In-memory data
let students = [
{id:1, name:"John"},
{id:2, name:"Sam"}
];
// GET all
app.get('/students', (req,res)=>{
res.json(students);
});
// POST
app.post('/students', (req,res)=>{
const newStudent = req.body;
students.push(newStudent);
res.json(newStudent);
});
// PUT
app.put('/students/:id', (req,res)=>{
const id = parseInt(req.params.id);
students = students.map(s => s.id === id ? req.body : s);
res.json({message:"Updated"});
});
// DELETE
app.delete('/students/:id', (req,res)=>{
const id = parseInt(req.params.id);
students = students.filter(s => s.id !== id);
res.json({message:"Deleted"});
});
app.listen(3000, ()=>console.log("Server running"));


PRG5----- MONGODB CONNECTION USING MONGOOSE

const mongoose = require('mongoose');
mongoose.connect('mongodb://127.0.0.1:27017/studentDB')
.then(() => console.log("MongoDB Connected"))
.catch(err => console.log("Connection Error:", err));

PRG6---- SCHEMA AND MODEL

const mongoose = require('mongoose');
const studentSchema = new mongoose.Schema({
name: {
type: String,
required: true
},
age: {
type: Number,
min: 18
},
department: String,
email: {
type: String,
unique: true
}
});
const Student = mongoose.model("Student", studentSchema);
console.log("Student Model Created");
module.exports = Student;
