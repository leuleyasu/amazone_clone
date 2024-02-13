const express =require('express');
const User =require('../models/user')

const authRouter=express.Router( ) 


authRouter.post(('/api/signup'),async (req,res)=>{
try {
  const {name, email, password}=req.body;
  const existingUser=  await User.findOne({ email:email});
  if (existingUser) {
    return res.status(400).json({msg:'user with the same email already exist!'});
  }
 
  let user =new User({
    email,password,name
  }) 
 
  user=user.save
  res.status(200).json(user);
  
} catch (error) {
  res.status(500).json({error:error.message})
}
})

module.exports=authRouter;