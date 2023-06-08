import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/app_provider.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:konash_app/features/choice_locale/choice_locale_navigator.dart';
import 'package:konash_app/features/choice_locale/choice_locale_view_model.dart';
import 'package:konash_app/features/major/presentation/major_screen.dart';
import 'package:konash_app/features/page_view_splash/page_view_splash.dart';
import 'package:provider/provider.dart';
import '../../config/user_provider.dart';
import '../../core/app_strings.dart';


class ChoiceLocaleScreen extends StatefulWidget {

  static const String routeName = AppStrings.change_locale;

  @override
  State<ChoiceLocaleScreen> createState() => _ChoiceLocaleScreenState();
}

class _ChoiceLocaleScreenState extends State<ChoiceLocaleScreen> implements ChoiceLocaleNavigator{

  bool isTabbed1 = false ;
  bool isTabbed2 = false ;
  bool isTabbed3 = false ;

  ChoiceLocaleViewModel viewModel = ChoiceLocaleViewModel();

  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
   return SafeArea(
     child: Scaffold(
       body: Center(
         child: Column(
           children: [
             Image(image: AssetImage ("assets/images/logo.png") ,
             width: 200,
             height: 200,) ,
             InkWell(
               onTap: (){
                 isTabbed1 = true ;
                 isTabbed2 = false ;
                 isTabbed3 = false ;
                 setState(() {

                 });
               },
               child: Container(
                 width: MediaQuery.of(context).size.width*0.5,
                 height: MediaQuery.of(context).size.height*0.1,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.black.withOpacity(0.1),
                         spreadRadius: 2 ,
                         blurRadius: 2
                     )
                   ]
                 ),
                 child: Center(child: Text ( AppStrings.english, style: Theme.of(context).textTheme.bodyMedium
                   !.copyWith(color: AppColors.primaryColor),)),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
             InkWell(
               onTap: (){
                 isTabbed2 = true ;
                 isTabbed1 = true ;
                 isTabbed3 = true ;
                 setState(() {

                 });
               },
               child: Container(
                 width: MediaQuery.of(context).size.width*0.5,
                 height: MediaQuery.of(context).size.height*0.1,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black.withOpacity(0.1),
                           spreadRadius: 2 ,
                           blurRadius: 2
                       )
                     ]
                 ),
                 child: Center(child: Text (AppStrings.arabic , style: Theme.of(context).textTheme.bodyMedium
                   !.copyWith(color: AppColors.primaryColor),)),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
             InkWell(
               onTap: (){
                 isTabbed3 = true ;
                 isTabbed2 = true ;
                 isTabbed1 = true ;
                 setState(() {

                 });
               },
               child: Container(
                 width: MediaQuery.of(context).size.width*0.5,
                 height: MediaQuery.of(context).size.height*0.1,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black.withOpacity(0.1),
                           spreadRadius: 2 ,
                           blurRadius: 2
                       )
                     ]
                 ),
                 child: Center(child: Text (AppStrings.francais , style: Theme.of(context).textTheme.bodyMedium
                   !.copyWith(color: AppColors.primaryColor),)),
               ),
             ) ,

             Spacer() ,

             if (isTabbed1 || isTabbed2 || isTabbed3) SizedBox(
               width: MediaQuery.of(context).size.width*0.7,
               child: ElevatedButton(onPressed: (){
                  provider.changeLang(viewModel.newLangFun(
                      isTabbed1, isTabbed2, isTabbed3));
                  navigateToPageViewSplash();
               }, child: Text ("Validate" ,
                 style: Theme.of(context).textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.primaryColor
               ),),
             ) else Container() ,
             SizedBox(height: 20,)

           ],
         ),
       ),
     ),
   );
  }

  @override
  void navigateToPageViewSplash() {
    var provider2 = Provider.of<UserProvider>(context , listen: false);
    provider2.user != null ?
    Navigator.pushReplacementNamed(context, MajorScreen.routeName):
    Navigator.pushReplacementNamed(context, PageViewSplash.routeName);
  }
}