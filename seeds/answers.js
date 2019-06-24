const answers = require('../samples/answerSamples');

exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('answers').del()
    .then(function () {
      // Inserts seed entries
      return knex('answers').insert(answers);
    });
};