const express = require("express");
const router = express.Router();
const Message = require("./schema");

// Get coach messaages and saving to database

router.post('/message', (req, res) => {
    const newMessage = new Message({ message: req.body.message });
    newMessage.save((err) => {
      if (err) {
        res.status(500).send(err);
      } else {
        res.send('Message saved successfully');
      }
    });
  });

// Displaying coach messages in member UI

router.get("/memberview", (req, res) => {
    Message.find({}, (err, messages) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.send(messages);
        }
    });
});

module.exports = router;