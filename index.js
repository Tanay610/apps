const express = require('express')
const app = express()
const port = 3000
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const jobrouter = require('./routes/job')
const bodyParser = require('body-parser')

dotenv.config();

mongoose.connect(process.env.MONGODB_URL)
    .then(() => console.log('Connected to v9'))
    .catch((err) => console.log(err));

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))    

app.use('/api/jobs', jobrouter)

app.get('/', (req, res) => res.send('Hello World!'))
app.listen(process.env.PORT || port, () => console.log(`The Hub listening on port ${process.env.PORT}!`))