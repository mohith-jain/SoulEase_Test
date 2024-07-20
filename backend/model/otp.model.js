const db = require('../config/db');
const mongoose = require('mongoose');
const { Schema } = mongoose;

const otpSchema = new Schema({
    email: {
        type: String
    },
    otp: {
        type: String,
        default: function() {
            return Math.floor(1000 + Math.random() * 9000).toString();
        },
        required: true
    },
}, { timestamps: true });

const OtpModel = db.model('otp', otpSchema);
module.exports = OtpModel;
