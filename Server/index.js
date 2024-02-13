const express = require('express');
const app = express();
const mongoose=require('mongoose');
const Db ='mongodb+srv://leuleyasu7:cseuBVkNQkzq69sF@cluster0.jyfffmt.mongodb.net/?retryWrites=true&w=majority'
const authRouter = require('./router/auth');
app.use(express.json());
app.use( authRouter);

mongoose.connect(Db).then(()=>{
    console.log('db connected');
})
app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
