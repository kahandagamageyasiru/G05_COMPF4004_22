const express = require("express");
const mongoose = require("mongoose");
mongoose.set("strictQuery", false);
const router = require("./msg_req_res");
const bodyParser = require('body-parser');

const port = 5000;
const app = express();
app.use(bodyParser.json());
app.use(router);

mongoose.connect("mongodb+srv://Navidu:123@cluster0.hjpvini.mongodb.net/?retryWrites=true&w=majority")
.then(() => {
    console.log("Connected");
});

app.listen(port, () => {
    console.log(`connected at port ${port}`)
});