const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routers/user.routes");
const ToDoRoute = require('./routers/todo.routes');
const app = express();

app.use(bodyParser.json())

 app.use("/users",UserRoute);
 app.use("/todos",ToDoRoute);

module.exports = app;