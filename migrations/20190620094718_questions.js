
exports.up = function (knex, Promise) {
    return knex.schema.createTable('questions', (table) => {
        table.increments();
        table.text('title');
        table.integer('id_step');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('questions');
};
