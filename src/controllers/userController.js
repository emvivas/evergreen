const user = {}

user.home=(req, res) => {
    if(req.session.user){
        res.render('monitoring/index.ejs', {res: req.session.user})
    } else{
        res.render('index.ejs')
    }
}

user.start=(req, res) => {
    res.render('signup.ejs')
}

user.access=(req, res) => {
    res.render('signin.ejs')
}

user.signup=(req, res) => {
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('CALL registerUser(@identificator, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); SELECT @identificator AS identificator;', 
        [data.username, data.email, data.telephoneNumber, data.name, data.firstLastname, data.secondLastname, data.sex, data.birthday, data.password, parseInt(data.country), data.state, data.city, data.zip, data.location], (err, user) => {
            if(err){
                res.json(err)
            } else{
                res.render('signin.ejs')
            }
        })
    })
}

user.signin=(req, res) => {
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('CALL accessUser(@identificator, ?, ?); SELECT @identificator AS identificator;', [data.username, data.password], (err, user) => {
            if(err){
                res.json(err)
            } else{
                if(user.pop()[0].identificator){
                    user[0][0].birthday = user[0][0].birthday.toISOString().substring(0,10)
                    req.session.user = user[0][0]
                    req.session.user.plants = user[1]
                    console.log(req.session.user.plants)
                    res.render('monitoring/index.ejs', {res: req.session.user})
                } else {
                    res.render('signin.ejs')
                }
            }
        })
    })
}

user.updateProfile=(req, res) => {
    res.render('monitoring/updateProfile.ejs', {res: req.session.user})
}

user.viewProfile=(req, res) => {
    res.render('monitoring/viewProfile.ejs', {res: req.session.user})
}

user.updateProfileForm=(req, res) => {
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('CALL updateUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);', 
        [req.session.user.identificator, data.username, data.email, data.telephoneNumber, data.name, data.firstLastname, data.secondLastname, data.sex, data.birthday, parseInt(data.country), data.state, data.city, data.zip, data.location], (err, user) => {
            if(err){
                res.json(err)
            } else{
                user[0][0].birthday = user[0][0].birthday.toISOString().substring(0,10)
                plants = req.session.user.plants
                req.session.user = user[0][0]
                req.session.user.plants = plants
                res.render('monitoring/viewProfile.ejs', {res: req.session.user})
            }
        })
    })
}

user.disableProfile=(req, res) => {
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('CALL disableUser(?);', [req.session.user.identificator], (err, user) => {
            if(err){
                res.json(err)
            } else{
                req.session.user = null
                res.render('index.ejs')
            }
        })
    })
}

user.registerPot=(req, res) => {
    const data = req.body
    req.getConnection((err, conn) => {
        conn.query('CALL registerPot(@identificator, ?, ?, ?, ?, ?); SELECT @identificator AS identificator;', [data.code, req.session.user.identificator, data.name, data.age, data.notes], (err, user) => {
            if(err){
                res.json(err)
            } else{
                if(user[0].length>0)
                    req.session.user.plants = user[0]
                res.render('monitoring/registerPotplant.ejs', {res: req.session.user})
            }
        })
    })
}

user.registerObservation=(req, res) => {
    const data = req.body
    console.log(data)
    req.getConnection((err, conn) => {
        conn.query('CALL registerStatus(@identificator, ?, ?, ?, ?, ?, ?, ?, ?, ?); SELECT @identificator AS identificator;', 
        [data.code, data.ipv4, parseFloat(data.temperature), parseFloat(data.humidity), parseFloat(data.surfaceHumidity), parseFloat(data.brightness), parseFloat(data.latitude), parseFloat(data.longitude), parseFloat(data.altitude)], (err, status) => {
            if(err){
                res.json(err)
            } else{
                res.render('index.ejs')
            }
        })
    })
}

user.potplantStatus=(req, res) => {
    const data = req.query
    if(Number.isInteger(parseInt(data.i))){
    req.getConnection((err, conn) => {
        conn.query('CALL selectTrasplantation(?, ?);', [data.i, req.session.user.identificator], (err, plant) => {
            if(err){
                res.json(err)
            } else{
                console.log(plant)
                res.render('monitoring/potplantStatus.ejs', {res: req.session.user, plant:plant[0][0], graphic:plant[1]})
            }
        })
    })
} else
    res.render('monitoring/index.ejs', {res: req.session.user})
}

user.logout=(req, res) => {
    req.session.user = null
    res.render('index.ejs')
}

user.registerPotplantForm=(req, res) => {
    res.render('monitoring/registerPotplant.ejs', {res: req.session.user})
}

module.exports=user