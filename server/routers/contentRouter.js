const express = require('express');

const router = express.Router();

const queries = require('../../db/queries');

const multer = require('multer');

const path = require('path');
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

const storage = multer.diskStorage({
    destination: './static/uploads',
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

const upload = multer({
    storage: storage
}).single('myImage');

// Routes
router.get('/:id', (req, res) => {
    queries.getWhereStep(req.params.id).then(sticker => {
        if (sticker) res.json(sticker);
        else res.json({
            message: 'This record doesn\'t exist'
        })
    })
})

router.get('/', (req, res) => {
    queries.getAll('content').then(response => {
        res.json(response);
    })
})

router.post('/', (req, res, next) => {
    //insert into db
    queries.create('content', req.body).then(response => {
        res.json(response);
    })
})

router.put('/:id', (req, res, next) => {
    // update the db
    queries.update('content', req.params.id, req.body).then(stickers => {
        if (stickers) res.json(stickers[0]);
        else res.json({ message: 'Not found' });
    })
})

router.delete('/:id', (req, res, next) => {
    queries.delete('content', req.params.id).then(() => {
        res.json({
            deleted: true
        })
    })
})

router.post('/upload', (req,res,err) => {
    upload(req, res, err => {
        backURL = req.header('Referer') || '/';
        let id = backURL.substring(33, backURL.length);
        let type = '';
        if (req.file.mimetype === 'image/png' || req.file.mimetype === 'image/jpg' || req.file.mimetype === 'image/jpeg') type = 'image';

        let data = {
            source: req.file.path.substring(7,req.file.path.length),
            id_step: id,
            type: type
        }
       
        queries.create('content', data).then(() => {
            res.redirect(backURL);
        })
    });
})

module.exports = router;