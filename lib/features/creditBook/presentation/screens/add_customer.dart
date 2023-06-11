import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/features/creditBook/presentation/screens/create_new_customer.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class ChoiceCreateOrImportCustomerScreen extends StatelessWidget {

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
              Navigator.pushNamed(context, CreateNewCustomer.routeName);
            }, child: Text ("CREATE NEW CUSTOMER" , style: Theme.of(context).
              textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
            ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, ChoiceCreateOrImportCustomerScreen.routeName);
            }, child: Text ("IMPORT NEW CUSTOMER" , style: Theme.of(context).
            textTheme.bodyLarge,) , style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text ("import contacts from your phone to add customers faster",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black , fontSize: 16 , fontWeight: FontWeight.normal
              ), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }

}