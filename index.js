const {Client} = require('pg');
const {mapUsers} = require('./utils/mapUsers');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '240221',
    database: 'fd_test'
}

const client = new Client(configs);

const users = [
    {
        firstName: 'Test1',
        lastName: 'Test2',
        email: '12345@kdjf'
    },
    {
        firstName: 'Test2',
        lastName: 'Test3',
        email: '52345@kdjf'
    },
    {
        firstName: 'Test4',
        lastName: 'Test5',
        email: '62345@kdjf'
    },
    {
        firstName: 'Test6',
        lastName: 'Test7',
        email: '72345@kdjf'
    },
    {
        firstName: 'Test8',
        lastName: 'Test9',
        email: '17345@kdjf'
    }
]

async function start() {
    await client.connect();
    const {rows} = await client.query(`INSERT INTO users (first_name, last_name, email) VALUES ${mapUsers(users)};`);
    console.log(rows);
    await client.end();
}

start();