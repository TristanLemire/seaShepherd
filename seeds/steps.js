const steps = require('../samples/stepSamples');

exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('steps').del()
    .then(function () {
      // Inserts seed entries
      return knex('steps').insert(steps);
    });
};
