PRG1---------

const http = require("http"); // Creating server
const server = http.createServer((req, res) => {
  //Setting response header
  res.writeHead(200, { "Content-Type": "text/plain" });

  // Handling different routes
  if (req.url === "/") {
    res.write("Welcome to Node.js Server");
  } 
  else if (req.url === "/about") {
    res.write("This is About Page");
  } 
  else {
    res.write("Page Not Found");
  }
  // Ending response
  res.end();
});

// Listening on port
server.listen(3000, () => {
  console.log("Server running at http://localhost:3000");
});

PRG2------------

const express = require('express'); const app = express(); 
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

PRG3------------

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

PRG4 --------------

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

app.listen(3000, ()=> console.log("Server running"));

PRG5------------

const mongoose = require('mongoose'); 
mongoose.connect('mongodb://127.0.0.1:27017/studentDB') 
.then(() => console.log("MongoDB Connected")) 
.catch(err => console.log("Connection Error:", err));

PRG6-------------

const mongoose = require('mongoose'); 

const studentSchema = new mongoose.Schema({ 
    name: { 
        type: String, 
        required: true 
    }, 
    age: { 
        type: Number, min: 18 
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

PRG7----------

program6 include

const mongoose = require('mongoose');
const Student = require('./student');

const main = async () => {
    try {
        await mongoose.connect(
            'mongodb://127.0.0.1:27017/studentDB'
        );

        console.log("MongoDB Connected");

        const s = new Student({
            name: "Smith",
            age: 21,
            department: "IT",
            email: "smith@gmail.com"
        });

        await s.save();

        console.log("Inserted");

        const data = await Student.find();

        console.log(data);

    } catch (err) {
        console.log("Error:", err);
    }
};

main();

PRG8------------

program6 - include

const mongoose = require('mongoose');
const Student = require('./student');

const main = async () => {
    try {
        await mongoose.connect(
            'mongodb://127.0.0.1:27017/studentDB'
        );

        console.log("MongoDB Connected");

        // Update
        const updateResult = await Student.updateOne(
            { name: "Smith" },
            { $set: { age: 22 } }
        );

        console.log("Updated:", updateResult);

        // Delete
        const deleteResult = await Student.deleteOne(
            { name: "Jones" }
        );

        console.log("Deleted:", deleteResult);

    } catch (err) {
        console.log("Error:", err);

    } finally {
        await mongoose.disconnect();
    }
};

main();

PRG9---------

const mongoose = require("mongoose");

async function main() {
    await mongoose.connect(
        "mongodb://127.0.0.1:27017/testdb"
    );

    console.log("Connected");

    const schema = new mongoose.Schema({
        name: {
            type: String,
            required: true
        },

        email: {
            type: String,
            match: /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        }
    });

    const Model = mongoose.model("Test", schema);

    const data = new Model({
        name: "Smith",
        email: "sk@gmail.com"
    });

    try {
        await data.save();
        console.log("Saved Successfully");
    } catch (err) {
        console.log(err.message);
    }

    await mongoose.disconnect();
}

main().catch(console.error);

PRG10-------

//INDEX.JS
const express = require("express");

const app = express();

// Middleware to read JSON data
app.use(express.json());

// Import route modules
const studentRoutes = require("./routes/studentRoutes");
const userRoutes = require("./routes/userRoutes");

// Use modular routes
app.use("/students", studentRoutes);
app.use("/users", userRoutes);

// Home route
app.get("/", (req, res) => {
    res.send("Express Modular Routing Application");
});

// Start server
const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});

//STUDENTROUTES.JS
routes/studentRoutes.js

const express = require("express");

const router = express.Router();

// GET all students
router.get("/", (req, res) => {
    res.json([
        { id: 1, name: "Smith", department: "IT" },
        { id: 2, name: "John", department: "CSE" },
        { id: 3, name: "David", department: "ECE" }
    ]);
});

// GET student by ID
router.get("/:id", (req, res) => {
    const id = req.params.id;

    res.send(`Details of student with ID: ${id}`);
});

// POST a new student
router.post("/", (req, res) => {
    const student = req.body;

    res.json({
        message: "Student added successfully",
        student: student
    });
});

// DELETE student
router.delete("/:id", (req, res) => {
    const id = req.params.id;

    res.send(`Student with ID ${id} deleted successfully`);
});

module.exports = router;

//USERROUTES.JS
routes/studentRoutes.js

const express = require("express");

const router = express.Router();

// GET all users
router.get("/", (req, res) => {
    res.json([
        { id: 1, name: "Alice" },
        { id: 2, name: "Bob" }
    ]);
});

// GET user by ID
router.get("/:id", (req, res) => {
    const id = req.params.id;

    res.send(`Details of user with ID: ${id}`);
});

// POST a new user
router.post("/", (req, res) => {
    const user = req.body;

    res.json({
        message: "User added successfully",
        user: user
    });
});

// DELETE user
router.delete("/:id", (req, res) => {
    const id = req.params.id;

    res.send(`User with ID ${id} deleted successfully`);
});

module.exports = router;

PRG11--------

const { MongoClient } = require("mongodb");

const url = "mongodb://127.0.0.1:27017";

const client = new MongoClient(url);

async function main() {
    try {
        // Connect to MongoDB
        await client.connect();

        console.log("Connected to MongoDB");

        const db = client.db("college");
        const students = db.collection("students");

        // Insert sample records
        await students.deleteMany({});

        await students.insertMany([
            { name: "Arun", age: 20, marks: 85, city: "Chennai" },
            { name: "Priya", age: 22, marks: 92, city: "Madurai" },
            { name: "Kumar", age: 19, marks: 68, city: "Chennai" },
            { name: "Divya", age: 21, marks: 75, city: "Coimbatore" },
            { name: "Ravi", age: 23, marks: 88, city: "Madurai" }
        ]);

        // 1. Marks greater than 80
        console.log("\nStudents with marks > 80:");

        console.log(
            await students.find({
                marks: { $gt: 80 }
            }).toArray()
        );

        // 2. Age greater than or equal to 21
        console.log("\nStudents with age >= 21:");

        console.log(
            await students.find({
                age: { $gte: 21 }
            }).toArray()
        );

        // 3. Marks between 70 and 90
        console.log("\nStudents with marks between 70 and 90:");

        console.log(
            await students.find({
                marks: { $gte: 70, $lte: 90 }
            }).toArray()
        );

        // 4. Students from Chennai or Madurai
        console.log("\nStudents from Chennai or Madurai:");

        console.log(
            await students.find({
                city: { $in: ["Chennai", "Madurai"] }
            }).toArray()
        );

        // 5. Age >= 20 AND marks > 80
        console.log("\nAge >= 20 AND marks > 80:");

        console.log(
            await students.find({
                $and: [
                    { age: { $gte: 20 } },
                    { marks: { $gt: 80 } }
                ]
            }).toArray()
        );

        // 6. City is Chennai OR marks > 90
        console.log("\nChennai OR marks > 90:");

        console.log(
            await students.find({
                $or: [
                    { city: "Chennai" },
                    { marks: { $gt: 90 } }
                ]
            }).toArray()
        );

    } catch (err) {
        console.log("Error:", err);

    } finally {
        await client.close();
    }
}

main();

PRG12------------


const express = require("express");

const app = express();

app.use(express.json());

// Student data
const students = [
    { id: 1, name: "Arun", department: "CSE" },
    { id: 2, name: "Bala", department: "IT" },
    { id: 3, name: "Chandru", department: "ECE" },
    { id: 4, name: "Dinesh", department: "CSE" },
    { id: 5, name: "Ezhil", department: "IT" },
    { id: 6, name: "Faisal", department: "ECE" },
    { id: 7, name: "Gopal", department: "CSE" },
    { id: 8, name: "Hari", department: "IT" },
    { id: 9, name: "Imran", department: "ECE" },
    { id: 10, name: "Jagan", department: "CSE" }
];

// Pagination API
app.get("/students", (req, res) => {

    // Get page and limit from URL
    const page = Math.max(1, parseInt(req.query.page) || 1);
    const limit = Math.max(1, parseInt(req.query.limit) || 3);

    // Calculate starting index
    const startIndex = (page - 1) * limit;

    // Calculate ending index
    const endIndex = page * limit;

    // Get records for current page
    const result = students.slice(startIndex, endIndex);

    // Calculate total pages
    const totalPages = Math.ceil(students.length / limit);

    res.json({
        page: page,
        limit: limit,
        totalRecords: students.length,
        totalPages: totalPages,
        students: result
    });
});

// Start server
app.listen(3000, () => {
    console.log("Server running at http://localhost:3000");
});

PRG13----------

const jwt = require("jsonwebtoken");

const generateToken = () => {
    const token = jwt.sign(
        { userId: 1 },
        "secret_key",
        { expiresIn: "1h" }
    );

    console.log(token);
};

generateToken();

PRG14---------

const bcrypt = require("bcrypt");

const hashPassword = async () => {
    const hashed = await bcrypt.hash("mypassword", 10);

    console.log("Hashed:", hashed);

    const match = await bcrypt.compare("mypassword", hashed);

    console.log("Match:", match);
};

hashPassword();

PRG15------------

const express = require("express");

const app = express();

app.use(express.json());

let students = [];

// Add Student
app.post("/students", (req, res) => {
    students.push(req.body);

    res.send("Student added successfully");
});

// View Students
app.get("/students", (req, res) => {
    res.json(students);
});

// Update Student
app.put("/students/:id", (req, res) => {
    const id = Number(req.params.id);

    if (id < 0 || id >= students.length) {
        return res.status(404).send("Student not found");
    }

    students[id] = req.body;

    res.send("Student updated successfully");
});

// Delete Student
app.delete("/students/:id", (req, res) => {
    const id = Number(req.params.id);

    if (id < 0 || id >= students.length) {
        return res.status(404).send("Student not found");
    }

    students.splice(id, 1);

    res.send("Student deleted successfully");
});

// Start server
app.listen(3000, () => {
    console.log("Server running on port 3000");
});
