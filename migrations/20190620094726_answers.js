
exports.up = function (knex, Promise) {
    return knex.schema.createTable('answers', (table) => {
        table.increments();
        table.text('answer');
        table.integer('id_step');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('answers');
};
