const UserServices = require('../services/user.services');
exports.register = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { email, password,otp} = req.body;
        const duplicate = await UserServices.getUserByEmail(email);
        if (duplicate) {
            throw new Error(`UserName ${email}, Already Registered`)
        }
        const fetchedOtp = await UserServices.getOtp(email);
        if(fetchedOtp === otp){
            const response = await UserServices.registerUser(email, password);

        res.status(201).json({ status: true, success: 'User registered successfully' });
        }
        else{
            res.json({ status: false, success: 'otp incorrect' });
        }
        


    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}

exports.login = async (req, res, next) => {
    try {

        const { email, password } = req.body;

        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }
        let user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }

        const isPasswordCorrect = await user.comparePassword(password);

        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }

        // Creating Token

        let tokenData;
        tokenData = { _id: user._id, email: user.email };
    

        const token = await UserServices.generateAccessToken(tokenData,"secret","1h")

        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
    

}
exports.sendOtp = async(req,res) =>{
    try{
        const email = req.body.email;
        const otp = UserServices.generateOtp();
        UserServices.saveOtp(otp,email)
        res.json({otp});
    }
    catch(error){
        console.log(error);
    }
}