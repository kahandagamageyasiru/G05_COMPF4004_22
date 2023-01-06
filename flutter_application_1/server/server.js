const express = require('express')
const app = express()
const port = 5000
const mongoose = require("mongoose");
mongoose.set("strictQuery", false);
var jwt = require('jsonwebtoken');

//db
//mongodb+srv://<username>:<password>@cluster0.orj5gqm.mongodb.net/?retryWrites=true&w=majority
async function connectDB() {
  await mongoose.connect("mongodb+srv://rasaljay:Rasal2002@cluster0.vvmpq3c.mongodb.net/?retryWrites=true&w=majority",);
  console.log("db connected");
}

connectDB();

//this takes the post body
app.use(express.json({extended: false}));

app.get('/', (req, res) =>
  res.send('Hello World!')
);

//model
var schema = new mongoose.Schema({ email: 'string', password: 'string' });
var User = mongoose.model('User', schema);

//signup route api
app.post("/signup", async (req, res) => {
  const {email, password } = req.body;
  console.log(email); 

  let user = await User.findOne({email});

  if (user) {
    return res.json({msg: "Email already taken"});
  }

  user = new User({
    email,
    password,
  });

  await user.save();
  var token = jwt.sign({ id: user.id }, 'password');
  res.json({token: token});
});

//login route api
app.post("/login", async (req, res) => {
  const{email, password } = req.body;
  console.log(email); 

  let user = await User.findOne({email});
  console.log(user);
  if (!user) {
    return res.json({msg: "no user found with that email"})
  }
  if (user.password !== password){
    return res.json({msg: "Incorrect Password"});
  }

  var token = jwt.sign({ id: user.id }, 'password');
  return res.json({token: token});
});

//private router
app.post("/private", async (req, res) => {
  let token = req.header("token")
  if (!token) {
   return res.json({msg: "sorry this is a private route"});
  }
  var decoded = jwt.verify(token, 'password');
  console.log(decoded.id);
  return res.json({msg: "you are in  the private route"})
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})