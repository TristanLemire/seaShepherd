
exports.up = function (knex, Promise) {
    return knex.schema.createTable('admins', (table) => {
        table.increments();
        table.text('name');
        table.text('password');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('admins');
};
