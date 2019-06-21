
exports.up = function (knex, Promise) {
    return knex.schema.createTable('answers', (table) => {
        table.increments();
        table.text('answer');
        table.integer('id_question');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('answers');
};
