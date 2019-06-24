const knex = require('./knex'); // The connection

module.exports = {
    getAll(table) {
        return knex(table);
    },
    getOne(table, id) {
        return knex(table).where('id', id).first();
    },
    create(table, object) {
        return knex(table).insert(object, '*');
    },
    update(table, id, object) {
        return knex(table).where('id', id).update(object);
    },
    delete(table, id) {
        return knex(table).where('id', id).del();
    },
    getWhere(table, id) {
        return knex(table).where('id_step', id);
    },
    getWhereStep(table, id) {
        return knex(table).where('id_step', id).orderBy('order', 'asc');
    },
    getWhereQuestion(table, id) {
        return knex(table).where('id_step', id);
    },
    countContent(id) {
        return knex('content').where('id_step', id).count();
    }
}