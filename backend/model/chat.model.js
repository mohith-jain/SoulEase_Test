const db = require('../config/db');
const UserModel = require("./user.model");
const mongoose = require('mongoose');
const { Schema } = mongoose;

const chatSchema = new Schema({
    email:{
        type: String
    },
    otp: {
        type: String,

    },
},{timestamps:true});

const OtpModel = db.model('otp',otpSchema);
module.exports = OtpModel;