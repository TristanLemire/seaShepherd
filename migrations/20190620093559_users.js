
exports.up = function(knex, Promise) {
    return knex.schema.createTable('users', (table) => {
        table.increments();
        table.text('name');
        table.text('date');
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('users');
};
