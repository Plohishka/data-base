const { client, User, Phone, Order } = require('./models/index');
const { getUsers } = require('./api/index');
const { generatePhones } = require('./utils/generate');

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

    // const { rows } = await User.bulkCreate(usersArray);
    const { rows: users } = await User.findAll();
    const { rows: phones } = await Phone.findAll();
    const orders = await Order.bulkCreate(users, phones);

    await client.end();
}

start();