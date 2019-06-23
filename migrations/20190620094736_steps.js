
exports.up = function (knex, Promise) {
    return knex.schema.createTable('steps', (table) => {
        table.increments();
        table.text('longitude');
        table.text('latitude');
        table.text('title');
        table.text('description');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('steps');
};
