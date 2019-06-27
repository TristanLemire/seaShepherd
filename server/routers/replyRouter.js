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
    queries.getOne('reply', req.params.id).then(sticker => {
        if (sticker) res.json(sticker);
        else res.json({
            message: 'This record doesn\'t exist'
        })
    })
})

router.get('/', (req, res) => {
    queries.getAll('reply').then(response => {
        res.json(response);
    })
})

router.post('/', (req, res) => {
    //insert into db
    queries.create('reply', req.body).then(response => {
        res.json(response);
    })
})

router.put('/:id', (req, res) => {
    // update the db
    queries.update('reply', req.params.id, req.body).then(stickers => {
        if (stickers) res.json(stickers[0]);
        else res.json({ message: 'Not found' });
    })
})

router.delete('/:id', (req, res) => {
    queries.delete('reply', req.params.id).then(() => {
        res.json({
            deleted: true
        })
    })
})

module.exports = router;