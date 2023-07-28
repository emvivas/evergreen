const express=require('express')
const session=require('express-session')
const path=require('path')
const morgan=require('morgan')
const mysql=require('mysql')
const myConnection=require('express-myconnection')
const bodyParser = require('body-parser')
const app=express()

// importing routes
const userRoute=require('./routes/user.js')
const { urlencoded } = require('express')

// settings
app.set('port', process.env.PORT || 8090)
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))

// middlewares
app.use(morgan('dev'))
app.use(session({
    secret:'evergreen',
    resave: true,
    saveUninitialized: true
}))
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: 'root',
    port: 3306,
    database: 'evergreen',
    multipleStatements: true
}, 'single'))
app.use(express.urlencoded({extended: true}))
app.use(bodyParser.urlencoded({extended:true}));

// routes
app.use('/', userRoute)

// static files
app.use(express.static(path.join(__dirname, 'views')))

app.listen(app.get('port'), () => {
    console.log('Server on port 8090')
})