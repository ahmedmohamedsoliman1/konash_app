import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/login/presentation/login_screen.dart';
import 'package:konash_app/features/page_view_splash/page_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewSplash extends StatelessWidget {

  static const String routeName = AppStrings.pageViewSplash;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: PageView (
                controller: controller,
                children: [
                   PageViewWidget(
                       title: "Welcome to ElFatore",
                       subTitle: "Track credits and payments.\n Simplify and speed up\n collection",
                       image: "assets/images/page1.png" ,
                   titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                     color: AppColors.primaryColor , fontSize: 25
                   ) ,
                   subTitleStyle: Theme.of(context).textTheme.bodyMedium!.
                     copyWith(color: Colors.black , fontSize: 16),) ,
                  Column(
                    children: [
                      Image(image: AssetImage ("assets/images/page2.png" ) , height:
                      MediaQuery.of(context).size.height*0.4,) ,
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                      RichText(
                        textAlign: TextAlign.center,
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Access all your " ,
                            style: TextStyle (color: Colors.black ,
                            fontSize: 16)
                          ),
                          TextSpan(
                              text: "credits and\n payments " ,
                              style: TextStyle (color: AppColors.primaryColor ,
                                  fontSize: 16)
                          ),
                          TextSpan(
                              text: "reports easily from any\n device" ,
                              style: TextStyle (color: Colors.black ,
                                  fontSize: 16)
                          )
                        ]
                      ))
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage ("assets/images/page3.png" ) , height:
                      MediaQuery.of(context).size.height*0.4,) ,
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Create " ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "an account for each one " ,
                                    style: TextStyle (color: AppColors.primaryColor ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "of\n" ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                ), TextSpan(
                                    text: "your customers " ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                ),

                              ]
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage ("assets/images/page4.png" ) , height:
                      MediaQuery.of(context).size.height*0.4,) ,
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Send " ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "Free & automatic " ,
                                    style: TextStyle (color: AppColors.primaryColor ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "payments\n reminders send via WhatsApp" ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                )
                              ]
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage ("assets/images/page5.png" ) , height:
                      MediaQuery.of(context).size.height*0.4,) ,
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Add " ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "notes and images " ,
                                    style: TextStyle (color: AppColors.primaryColor ,
                                        fontSize: 16)
                                ),
                                TextSpan(
                                    text: "for each of\n your transactions" ,
                                    style: TextStyle (color: Colors.black ,
                                        fontSize: 16)
                                )
                              ]
                          ))
                    ],
                  ),
                ],
              ),
            ),
               Container(
                 height: MediaQuery.of(context).size.height*0.02,
                 child: SmoothPageIndicator(
            controller: controller,  // PageController
            count:  5,
            // forcing the indicator to use a specific direction
            textDirection: TextDirection.ltr,
            effect:  ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor
            ),
              ),
             ) ,
            SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              child: ElevatedButton(onPressed: (){
                   Navigator.pushReplacementNamed(
                       context, LoginScreen.routeName);
              }, child: Text ("Start" , style: Theme.of(context).textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor
              ),),
            )
          ],
        ),
      ),
    );
  }
}