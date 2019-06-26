
exports.up = function (knex, Promise) {
    return knex.schema.createTable('reply', (table) => {
        table.increments();
        table.integer('id_step');
        table.integer('id_user');
        table.integer('id_answer');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('reply');
};
