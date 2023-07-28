const express=require('express')
const router=express.Router()

const userController=require('../controllers/userController.js')

router.get('/', userController.home)
router.get('/start', userController.start)
router.get('/access', userController.access)
router.get('/updateProfile', userController.updateProfile)
router.get('/profile', userController.viewProfile)
router.get('/disableProfile', userController.disableProfile)
router.get('/potplantStatus', userController.potplantStatus)
router.get('/logout', userController.logout)
router.get('/registerPotplant', userController.registerPotplantForm)
router.post('/signup', userController.signup)
router.post('/signin', userController.signin)
router.post('/updateProfile', userController.updateProfileForm)
router.post('/registerPot', userController.registerPot)
router.post('/registerObservation', userController.registerObservation)

module.exports=router