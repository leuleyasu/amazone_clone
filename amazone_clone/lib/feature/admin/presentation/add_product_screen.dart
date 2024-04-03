import 'package:amazone_clone/feature/common/cusotom_textfield.dart';
import 'package:amazone_clone/feature/presentation/widget/custom_Button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProducrScreen extends StatefulWidget {
  const AddProducrScreen({super.key});

  @override
  State<AddProducrScreen> createState() => _AddProducrScreenState();
}

class _AddProducrScreenState extends State<AddProducrScreen> {
  @override
  Widget build(BuildContext context) {
  TextEditingController PdtNameController= TextEditingController();
  TextEditingController descrNameController= TextEditingController();
  
  TextEditingController PriceNameController= TextEditingController();
  
  TextEditingController quantityNameController= TextEditingController();
  @override

  @override
  void dispose() { 
    PdtNameController.dispose();
    descrNameController.dispose();
    PriceNameController.dispose();
    quantityNameController.dispose();
    super.dispose();
    
  }
  String category="category";
  List <String> PdtCategorie=['Mobile','Essential',
  'Appliance','Books','Fashon'];
    return Scaffold(
    body: SingleChildScrollView(

      child: Form(

        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [10,4],
            strokeCap: StrokeCap.square,
            child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
          
        ),
        child:const Column(
          children:[
         Icon(Icons.folder_open),
         Text("select product Type")
          ],
        ),
          )),
          CustomTextField(controller: PdtNameController, hintText: "product name")
       
      ,const SizedBox(height: 10,),
      CustomTextField(controller: descrNameController, hintText: "description")
      
      ,const SizedBox(height: 10,),
      CustomTextField( maxLines: 4,controller: descrNameController, hintText: "description")
      ,const SizedBox(height: 10,),
      
      CustomTextField(controller: quantityNameController, hintText: "description")
   ,   
SizedBox( width: 50,
   child:   DropdownButton(
    value: category,
    icon: const Icon(Icons.arrow_circle_down),
    items: PdtCategorie.map((String item) =>
     DropdownMenuItem(
      value: item,
      child: Text(item) )).toList()
    
   , onChanged: (String? newval){
    setState(() {
      category=newval!;
    });
   }
   )
        ),
        CutomButton(onTap: (){}, text: "text")
        ],
        
        ),
      ),
    ),
    );
  }
}