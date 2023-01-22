const express = require("express");
const bodyParser = require('body-parser');
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
mongoose.set("strictQuery", false);

const PORT = 5000;
const app = express();

app.use(express.json());
app.use(authRouter);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const DB =
"mongodb+srv://dhanish:dhanish2005@cluster0.orj5gqm.mongodb.net/?retryWrites=true&w=majority";

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
