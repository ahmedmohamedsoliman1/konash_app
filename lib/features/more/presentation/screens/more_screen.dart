import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:konash_app/features/more/presentation/screens/business_card_screen.dart';

import '../widgets/more_widget.dart';

class MoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 30),
          child: Column (
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text ("More" , style: Theme.of(context).textTheme.bodyLarge!.
                    copyWith(color: AppColors.primaryColor , fontSize: 22),),
                  Row(
                    children: [
                      Text("Share with \nfriends" , style: TextStyle(
                        color: Colors.black , fontSize: 16 ,
                        fontWeight: FontWeight.normal
                      ), textAlign: TextAlign.center,),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        child: InkWell(
                          onTap: (){},
                            child: Icon (Icons.share , color: Colors.white,)),
                        backgroundColor: AppColors.primaryColor,
                      )
                    ],
                  )
                ],
              ) ,
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
             MoreWidget (title: "Business Card",
               avatarIcon: Icons.sim_card_outlined,
             onPressed: (){
             Navigator.pushNamed(context, BusinessCardScreen.routeName);
             },),
             SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             MoreWidget (title: "Settings",
               avatarIcon: Icons.settings,
             onPressed: (){

             },),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             MoreWidget (title: "Automatic backup",
               avatarIcon: Icons.settings_backup_restore,
               onPressed: (){

               },),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             MoreWidget (title: "Discover more apps",
               avatarIcon: Icons.more_outlined,
               onPressed: (){

               },)
            ],
          ),
        ),
      ),
    );
  }
}