const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email: email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exists!" });
    }
    const hasPasword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hasPasword,
      name,
    }); // Save the user and await the save operation
    user = await user.save();
    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const existingUser = await User.findOne({ email: email });
    const isMatch = await bcryptjs.compare(password, existingUser.password);

    if (!existingUser) {
      res.status(400).json({ msg: "user with this email doesnt exists!" });
    }
    if (!isMatch) {
      res.status(400).json({ msg: "Incorrect Password !" });
    }

    const token = jwt.sign({ id: existingUser.id }, "passwordKey");
    res.json({ token, ...existingUser._doc });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

authRouter.post("api/verified", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.json(false);
    }
    const user = await User.findByID(verified.id);
    if (!user) {
      return res.json(false);
    }
    return res.json(true);
  } catch (error) {}
});

authRouter.get("/", auth, async (req, res) => {
  const user = await User.findByID(req.user);
  res.json({ ...user._doc, token: req.token });
});
module.exports = authRouter;
