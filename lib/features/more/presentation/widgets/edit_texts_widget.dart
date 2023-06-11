import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/user_provider.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:provider/provider.dart';

class EditTextsWidget extends StatelessWidget {

  static TextEditingController nameController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController cityController = TextEditingController();

  String name  = "";
  String description = "";
  String address = "";
  String city = "";




  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
   return Expanded(
     child: Container(
       padding: EdgeInsets.all(20),
       child: ListView(
         children: [
           Text("PHONE NUMBER" , style: Theme.of(context).textTheme.bodyMedium!.
             copyWith(color: AppColors.primaryColor),) ,
           SizedBox(height: 5 ,) ,
           TextFormField(
             readOnly: true,
             decoration: InputDecoration(
               hintText: provider.userModel!.phone
             ),
           ),
           SizedBox(height: 10 ,) ,
           Text("NAME" , style: Theme.of(context).textTheme.bodyMedium!.
           copyWith(color: AppColors.primaryColor),) ,
           SizedBox(height: 5 ,) ,
           TextFormField(
             onChanged: (text){
               name = text ;
             },
             controller: nameController,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
                 hintText: "name"
             ),
           ),
           SizedBox(height: 10 ,) ,
           Text("BUSINESS DESCRIPTION" , style: Theme.of(context).textTheme.bodyMedium!.
           copyWith(color: AppColors.primaryColor),) ,
           SizedBox(height: 5 ,) ,
           TextFormField(
             onChanged: (text){
               description = text ;
             },
             controller: descriptionController,
             decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: "business description"
             ),
           ),
           SizedBox(height: 10 ,) ,
           Text("ADDRESS" , style: Theme.of(context).textTheme.bodyMedium!.
           copyWith(color: AppColors.primaryColor),) ,
           SizedBox(height: 5 ,) ,
           TextFormField(
             onChanged: (text){
               address = text ;
             },
             controller: addressController,
             decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: "address"
             ),
           ),
           SizedBox(height: 10 ,) ,
           Text("CITY" , style: Theme.of(context).textTheme.bodyMedium!.
           copyWith(color: AppColors.primaryColor),) ,
           SizedBox(height: 5 ,) ,
           TextFormField(
             onChanged: (text){
               city = text ;
             },
             controller: cityController,
             decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: "city"
             ),
           ),
         ],
       ),
     ),
   );
  }
}