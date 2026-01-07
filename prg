PRG1

File: Src/App.jsx
import { useState } from 'react';
function App() {
const [count, setCount] = useState(0);
const increment = () => {
setCount(count + 1);
};
const decrement = () =>{
setCount(count - 1);
};
const reset = () => {
setCount(0);
};
return (
<div style={{ textAlign: &quot;center&quot;, marginTop: &quot;50px&quot; }}>;
<h1>React Counter App</h1>
<h2>{count}</h2>;
<button onClick={increment} style={{ margin: &quot;10px&quot; }}>
Increment
</button>
<button onClick={decrement} style={{ margin: "10px" }}>;

Decrement
</button>
<button onClick={reset} style={{ margin: "10px" }}>;
Reset
</button>
</div>;
);
}
export default App;


PRG2

File: Src/App.jsx
import { useState } from'react';

function App() {
const [tasks, setTasks] = useState([]);
const [text, setText] = useState("");

const addTask = () =&gt; {
if (text === "") return;

setTasks([...tasks, { name: text, completed: false }]);
setText("");
};

const deleteTask = (index) => {
setTasks(tasks.filter((_, i) => i !== index));
};

const toggleTask = (index) => {
setTasks(
tasks.map((task, i) =>
i === index ? { ...task, completed: !task.completed } : task
)

);
};

return (
<div>;
<h1>To Do List</h1>

<input
value={text}
onChange={(e) => setText(e.target.value)}
placeholder="Enter task"
/>
<button onClick={addTask}>;Add</button>;

<ul>
{tasks.map((task, index) => (
<li key={index}>;
<input
type="checkbox"
checked={task.completed}
onChange={() => toggleTask(index)}
/>

<span className={task.completed ? "done": &quot;&quot;}>
{task.name}
</span>

<button onClick={() =&gt; deleteTask(index)}>Delete</button>
</li>
))}
</ul>
</div>
);
}
export default App;



PRG3


import React ,{useState}from 'react'

function App() {
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [submitData, setSubmitData] = useState(null)
  const handleSubmit = (e) => {
    e.preventDefault();
    const formdata = { name, email, password };
    setSubmitData(formdata);
    setName("");
    setEmail("");
    setPassword("");

  }
  return (
    <div>
      <h2>forms</h2>
      <form onSubmit={handleSubmit}>
        <label>Name:</label>
        <input type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required />
        <label>Email:</label>
        <input type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required />
        <label>Password:</label>
        <input type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required />
        <button type="submit">Submit</button>

        {submitData && (
          <div>
            <h3>Submitted Data:</h3>
            <p><strong>Name</strong> {submitData.name}</p>
            <p><strong>Email</strong> {submitData.email}</p>
            <p><strong>Password</strong> {submitData.password}</p>
          </div>)}

      </form>
    </div>
  )
}

export default App
