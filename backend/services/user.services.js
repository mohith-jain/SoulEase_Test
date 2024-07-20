const UserModel = require("../model/user.model");
const OtpModel = require("../model/otp.model");
const jwt = require("jsonwebtoken");
const otpGenerator = require('otp-generator');
const { options } = require("../app");

class UserServices{
 
    static async registerUser(email,password){
        try{
                console.log("-----Email --- Password-----",email,password);
                
                const createUser = new UserModel({email,password});
                return await createUser.save();
        }catch(err){
            throw err;
        }
    }

    static async getUserByEmail(email){
        try{
            return await UserModel.findOne({email});
        }catch(err){
            console.log(err);
        }
    }

    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
    static generateOtp(){
        const otp = otpGenerator.generate(6, { upperCaseAlphabets: false, specialChars: false });
        console.log(otp);
        return otp;

    }
    static async saveOtp(otp,email){
        const newOtp = new OtpModel({email,otp});
        console.log(newOtp);
        await newOtp.save();
        console.log(9);
    }
    static async getOtp(email){
        const user = await OtpModel.findOne({email});
        return user.otp;
    }
}

module.exports = UserServices;