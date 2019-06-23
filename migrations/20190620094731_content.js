
exports.up = function (knex, Promise) {
    return knex.schema.createTable('content', (table) => {
        table.increments();
        table.text('source');
        table.text('type');
        table.text('subtitle')
        table.integer('order');
        table.text('content');
        table.integer('id_step');
    })
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('content');
};
