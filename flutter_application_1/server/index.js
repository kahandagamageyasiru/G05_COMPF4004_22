const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
mongoose.set("strictQuery", false);

const PORT = 8000;
const app = express();

app.use(express.json());
app.use(authRouter);

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
