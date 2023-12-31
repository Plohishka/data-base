const { Client } = require('pg');
const configs = require('../configs/db');
const User = require('./User');
const Phone = require('./Phone');
const Order = require('./Order');

const client = new Client(configs);

User._client = client;
User._tableName = 'users';
Order._client = client;
Phone._client = client;
Phone._tableName = 'products';

module.exports = {
    client, User, Order, Phone
}
