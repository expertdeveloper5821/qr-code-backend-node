import express from "express";
const router = express();
import userController from "../controller/userController";

// create user route
router.post("/create", userController.register_user);

//login route
router.post("/login", userController.login_user);

//logout route
router.post("/logout/:id", userController.logout_user);

// send mail route
router.post("/sendmail", userController.send_user_password_reset_email);

//reset password route
router.post("/resetpassword", userController.user_password_reset);

//change password route
router.post("/changepassword/:id", userController.user_password_change);

module.exports = router;
