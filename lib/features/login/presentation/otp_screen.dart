import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/fireBase_fun.dart';
import 'package:konash_app/config/user_provider.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/login/data/user_model.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import 'package:pinput/pinput.dart';

import '../../major/presentation/major_screen.dart';
import 'login_screen.dart';

class OTPScreen extends StatelessWidget{
  static const String routeName = AppStrings.otp ;

  FirebaseAuth auth = FirebaseAuth.instance;

  var smsCode = "" ;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map ;
    var provider = Provider.of<UserProvider>(context);
   return SafeArea(
     child: Scaffold(
       body: Center (
         child: Column (
           children: [
             SizedBox(height: MediaQuery.of(context).size.height*0.1,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Text("Please enter the confirmation code received by SMS" , style:
               Theme.of(context).textTheme.bodyLarge!.copyWith(
                   color: AppColors.primaryColor ,
                   fontSize: 20
               ), textAlign: TextAlign.center,),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             RichText(
                 textAlign: TextAlign.center,
                 text: TextSpan(
                     children: [
                       TextSpan(
                           text: "A 6-digit code has been sent to " ,
                           style: TextStyle (color: Colors.black ,
                               fontSize: 16)
                       ),
                       TextSpan(
                           text: "${args["phone"]}" ,
                           style: TextStyle (color: AppColors.primaryColor ,
                               fontSize: 16)
                       ),
                     ]
                 )),
             SizedBox(height: 10,),
             InkWell(
               onTap: (){
                 Navigator.pop(context);
               },
               child: Text("Change" ,
                 style: TextStyle (color: AppColors.primaryColor ,
                     decoration: TextDecoration.underline ),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             Pinput(
               onChanged: (code){
                 smsCode = code ;
               },
               length: 6,
               defaultPinTheme: defaultPinTheme,
               validator: (s) {
                 return s == smsCode ? null : 'Pin is incorrect';
               },
               pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
               showCursor: true,
               onCompleted: (pin) => print(pin),
             ),
             Spacer() ,
             SizedBox(
               width: MediaQuery.of(context).size.width*0.7,
               child: ElevatedButton(onPressed: ()async{
                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
                     verificationId: LoginScreen.verify,
                     smsCode: smsCode);

                 // Sign the user in (or link) with the credential
                 await auth.signInWithCredential(credential);
                 var userId = FirebaseAuth.instance.currentUser!.uid;
                 UserModel userModel = UserModel(id: userId, phone: args["phone"]);
                 await FireBaseFun.addUserPhoneToFireBase(userModel);
                 var user = await FireBaseFun.getUserPhoneFromFireBase(userId);
                 provider.userModel = user ;
                 Navigator.pushReplacementNamed(context, MajorScreen.routeName);
               }, child: Text ("Continue" , style: Theme.of(context).textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.primaryColor
               ),),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.03,)
           ],
         ),
       ),
     ),
   );
  }
}