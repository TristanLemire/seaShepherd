const admins = require('../samples/adminSamples');

exports.seed = function (knex, Promise) {
  // Deletes ALL existing entries
  return knex('admins').del()
    .then(function () {
      // Inserts seed entries
      return knex('admins').insert(admins);
    });
};
