const router = require("express").Router();
const UserController = require('../controller/user.controller');

router.post("/register",UserController.register);

router.post("/login", UserController.login);
router.post("/sendOtp", UserController.sendOtp);

module.exports = router;