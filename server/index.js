const express = require('express')
const consola = require('consola')
const { Nuxt, Builder } = require('nuxt')
const app = express()
const bodyParser = require('body-parser');

// Router imports
const userRouter = require('./routers/userRouter');
const questionRouter = require('./routers/questionRouter');
const contentRouter = require('./routers/contentRouter');
const replyRouter = require('./routers/replyRouter');
const answerRouter = require('./routers/answerRouter');
const stepRouter = require('./routers/stepRouter');
const adminRouter = require('./routers/adminRouter');

// Import and Set Nuxt.js options
let config = require('../nuxt.config.js')
config.dev = !(process.env.NODE_ENV === 'production')

async function start() {
  // Init Nuxt.js 
  const nuxt = new Nuxt(config)

  const { host, port } = nuxt.options.server

  // body parser
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: false }));

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  } else {
    await nuxt.ready()
  }
  // Use my routers
  app.use('/api/users', userRouter);
  app.use('/api/answers', answerRouter);
  app.use('/api/reply', replyRouter);
  app.use('/api/contents', contentRouter);
  app.use('/api/questions', questionRouter);
  app.use('/api/steps', stepRouter);
  app.use('/api/admins', adminRouter);

  // Give nuxt middleware to express
  app.use(nuxt.render)

  // Listen the server
  app.listen(port, host);
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}
start()
