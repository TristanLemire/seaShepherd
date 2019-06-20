const express = require('express');

const router = express.Router();

const queries = require('../../db/queries');

// Validation functions
// function isValidId(req, res, next) {
//     if (!isNaN(req.params.id)) return next();
//     next(new Error('Invalid ID'));
// }

// function validSticker(sticker) {
//     const hasTitle = typeof sticker.title == 'string' && sticker.title.trim() !== '';
//     const hasUrl = typeof sticker.url == 'string' && sticker.url.trim() !== '';
//     const hasDescription = typeof sticker.description == 'string' && sticker.description.trim() !== '';
//     const hasRating = !isNaN(sticker.rating);
//     return hasTitle && hasUrl && hasDescription && hasRating;
// }

// Routes
router.get('/:id', (req, res) => {
    queries.getOne('answers', req.params.id).then(sticker => {
        if (sticker) res.json(sticker);
        else res.json({
            message: 'This record doesn\'t exist'
        })
    })
})

router.get('/', (req, res) => {
    queries.getAll('answers').then(response => {
        res.json(response);
    })
})

router.post('/', (req, res, next) => {
    //insert into db
    console.log(req.body);
    queries.create('answers', req.body).then(response => {
        res.json(response);
    })
})

router.put('/:id', (req, res, next) => {
    // update the db
    queries.update('answers', req.params.id, req.body).then(stickers => {
        if (stickers) res.json(stickers[0]);
        else res.json({ message: 'Not found' });
    })
})

router.delete('/:id', (req, res, next) => {
    queries.delete('answers', req.params.id).then(() => {
        res.json({
            deleted: true
        })
    })
})

module.exports = router;