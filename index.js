const { User } = require('./models/index');
const { getUsers } = require('./api/index');

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

    const usersArray = await getUsers();

    const { rows } = await User.bulkCreate(usersArray);
    await client.end();
}

start();