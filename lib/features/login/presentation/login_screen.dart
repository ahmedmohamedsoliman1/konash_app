import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/login/presentation/otp_screen.dart';
import '../../../core/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName = AppStrings.login ;
  static String verify = "" ;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CountryCode countryCode = CountryCode() ;
  String phone = "" ;
  var formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: Center(
         child: Column (
           children: [
             SizedBox(
               height: MediaQuery.of(context).size.height*0.1,
             ),
             Text("Please enter your phone number" , style:
               Theme.of(context).textTheme.bodyLarge!.copyWith(
                 color: AppColors.primaryColor ,
                 fontSize: 20
               ),),
             SizedBox(
               height: MediaQuery.of(context).size.height*0.04,
             ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 2
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: CountryCodePicker(
                          onChanged: (code){
                            countryCode = code ;
                            setState(() {

                            });
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IT',
                          favorite: ['+39','FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                        )),

                    Text("|" , style: TextStyle(color: Colors.black26 , fontSize: 40),)
,
                    Expanded(
                      flex: 2,
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: controller,
                            onChanged: (text){
                              phone = text ;
                            },
                            validator: (text){
                              if (text == null || text.trim().isEmpty){
                                return "Please phone is required" ;
                              }else {
                                return null ;
                              }
                            },
                            keyboardType: TextInputType.phone,
                             decoration: InputDecoration(
                               hintText: "Enter your phone" ,
                             ),
                          ),
                        )),


                  ],
                ),
              ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text("The phone number allows you to access your Elfatora safely from any device" ,
                   style: TextStyle (color: Colors.black ,
                       fontSize: 16), textAlign: TextAlign.center,),
             ),
             Spacer() ,
             SizedBox(
               width: MediaQuery.of(context).size.width*0.7,
               child: ElevatedButton(onPressed: ()async{
                if (formKey.currentState!.validate() == true){
                  print(countryCode.dialCode);
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countryCode.dialCode!+phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      LoginScreen.verify = verificationId ;
                      setState(() {

                      });
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  Navigator.pushNamed(context, OTPScreen.routeName,
                  arguments: {
                    "phone" : phone ,
                    "countryCode" : countryCode
                  });
                  controller.clear();
                }
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