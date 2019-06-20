const express = require('express');

const router = express.Router();

const queries = require('../db/queries');

// Validation functions
function isValidId(req, res, next) {
    if (!isNaN(req.params.id)) return next();
    next(new Error('Invalid ID'));
}

function validSticker(sticker) {
    const hasTitle = typeof sticker.title == 'string' && sticker.title.trim() !== '';
    const hasUrl = typeof sticker.url == 'string' && sticker.url.trim() !== '';
    const hasDescription = typeof sticker.description == 'string' && sticker.description.trim() !== '';
    const hasRating = !isNaN(sticker.rating);
    return hasTitle && hasUrl && hasDescription && hasRating;
}

// Routes
router.get('/:id', isValidId, (req, res) => {
    queries.getOne(req.params.id).then(sticker => {
        if (sticker) res.json(sticker);
        else res.json({
            message: 'This record doesn\'t exist'
        })
    })
})

router.get('/', (req, res) => {
    queries.getAll().then(stickers => {
        res.json(stickers);
    })
})

router.post('/', (req, res, next) => {
    if (validSticker(req.body)) {

        //insert into db
        queries.create(req.body).then(sticker => {
            res.json(sticker[0]);
        })

    } else {
        next(new Error('Invalid sticker'));
    }
})

router.put('/:id', isValidId, (req, res, next) => {
    if (validSticker(req.body)) {
        // update the db
        queries.update(req.params.id, req.body).then(stickers => {
            if (stickers) res.json(stickers[0]);
            else res.json({ message: 'Not found' });
        })
    } else {
        next(new Error('Invalid sticker'));
    }
})

router.delete('/:id', isValidId, (req, res, next) => {
    queries.delete(req.params.id).then(() => {
        res.json({
            deleted: true
        })
    })
})

module.exports = router;