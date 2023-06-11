import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/app_prefs.dart';
import 'package:konash_app/config/user_provider.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/edit_texts_widget.dart';

class BusinessCardScreen extends StatefulWidget {

  static const String routeName = AppStrings.business_card ;

  @override
  State<BusinessCardScreen> createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  PageController controller = PageController();

  bool isPressed = false ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar (
        title: Text ("BUSINESS CARD" , style: Theme.of(context)
            .textTheme.bodyMedium!.copyWith(
            color: AppColors.primaryColor,
          fontSize: 18
          )
        ,),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: PageView(
              controller: controller,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2 ,
                                spreadRadius: 2 ,
                                color: Colors.black.withOpacity(0.05)
                            )
                          ]
                      ),
                      child: Image(image: AssetImage ("assets/images/1.png") ,
                        width: double.infinity, height: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Phone : " , style: TextStyle (
                                  color: Colors.black
                              ),),
                              Text(provider.userModel!.phone , style: TextStyle (
                                  color: Colors.black
                              ),)
                            ],
                          ),
                        ],
                      ),

                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2 ,
                                spreadRadius: 2 ,
                                color: Colors.black.withOpacity(0.05)
                            )
                          ]
                      ),
                      child: Image(image: AssetImage ("assets/images/2.png") ,
                        width: double.infinity, height: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Phone : " , style: TextStyle (
                                  color: Colors.white
                              ),),
                              Text(provider.userModel!.phone , style: TextStyle (
                                  color: Colors.white
                              ),),

                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2 ,
                                spreadRadius: 2 ,
                                color: Colors.black.withOpacity(0.05)
                            )
                          ]
                      ),
                      child: Image(image: AssetImage ("assets/images/3.png") ,
                        width: double.infinity, height: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Phone : " , style: TextStyle (
                                  color: Colors.black
                              ),),
                              Text(provider.userModel!.phone , style: TextStyle (
                                  color: Colors.black
                              ),),

                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2 ,
                                spreadRadius: 2 ,
                                color: Colors.black.withOpacity(0.05)
                            )
                          ]
                      ),
                      child: Image(image: AssetImage ("assets/images/4.png") ,
                        width: double.infinity, height: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Phone : " , style: TextStyle (
                                  color: Colors.black
                              ),),
                              Text(provider.userModel!.phone , style: TextStyle (
                                  color: Colors.black
                              ),)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height*0.02,
            child: SmoothPageIndicator(
              controller: controller,  // PageController
              count:  4,
              // forcing the indicator to use a specific direction
              textDirection: TextDirection.ltr,
              effect:  WormEffect(
                  activeDotColor: AppColors.primaryColor
              ),
            ),
          ) ,
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height*0.03,
            child: ElevatedButton(onPressed: (){
             isPressed = true ;
             setState(() {

             });

            }, child: Text ("Edit business card") ,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor),),
          ),
          isPressed == true ? EditTextsWidget () : Spacer(),
          isPressed == true ? Container(
            height: MediaQuery.of(context).size.height*0.06,
            width: MediaQuery.of(context).size.width*0.7,
            child: ElevatedButton(onPressed: (){
              if (EditTextsWidget.nameController.text != ""){
                AppPrefs.saveNameCard(EditTextsWidget.nameController.text);
              }if (EditTextsWidget.descriptionController.text != ""){
                AppPrefs.saveNameCard(EditTextsWidget.descriptionController.text);
              }if (EditTextsWidget.addressController.text != ""){
                AppPrefs.saveNameCard(EditTextsWidget.addressController.text);
              }if (EditTextsWidget.cityController.text != ""){
                AppPrefs.saveNameCard(EditTextsWidget.cityController.text);
              }
                print("saved");
            }, child: Text ("VALIDATE") ,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue),),
          ) : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  child: ElevatedButton(onPressed: (){

                  }, child: Text ("DOWNLOAD") ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue),),
                ),),
                SizedBox(width: MediaQuery.of(context).size.width*0.01),
                Expanded(child: Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  child: ElevatedButton(onPressed: (){

                  }, child: Text ("SHARE") ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),),
                ),)
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.07,)
        ],
      ),
    );
  }
}