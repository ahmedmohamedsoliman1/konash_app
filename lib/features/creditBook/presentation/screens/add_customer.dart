import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class ChoiceCreateOrImportScreen extends StatelessWidget {

  static const String routeName = AppStrings.choice_create_import;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text  ("ADD CUSTOMER" , style: Theme.of(context).textTheme.bodyLarge!
            .copyWith(color: AppColors.primaryColor),),
        ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, ChoiceCreateOrImportScreen.routeName);
            }, child: Text ("CREATE NEW CUSTOMER" , style: Theme.of(context).
              textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor
            ),),
          )
        ],
      ),
    );
  }

}