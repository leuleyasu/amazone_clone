const mongoose=require('mongoose');

const UserSchema =mongoose.Schema({

    name:{
        required:true,
        type:String,
        trim:true,
        
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: function(val) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailRegex.test(val);
            },
            message: 'Please enter a valid email address.'
        }
    },
    password:{
required:true,
type:String,
minlength:6,
validate:{validator:function(val){
    return val.length>=6;
},
message:'please enter a valid passwords'

}
    },
    address:{
        type:String,
        default:'', 

    },
    type:{
        type:String,
        default:'user'
    }


})

const User =mongoose.model("user",UserSchema);

module.exports=User;