const express = require("express");
const Notes = require("./noteschema");
const yasirurouter = express.Router();
const Note = require('./noteschema');

// Saving data in database when user types the messages

yasirurouter.post('/notes', (req, res) => {
    const newNote = new Note({ note: req.body.note });
    console.log(newNote)
    newNote.save()
        .then(() => res.json({ status: 'Note added successfully' }))
        .catch((err) => res.status(500).json({ status: 'Error', message: err.message }));
});

yasirurouter.get("/list", (req, res) => {
    Notes.find({}, (err, messages) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.send(messages);
        }
    });
});


module.exports = yasirurouter;