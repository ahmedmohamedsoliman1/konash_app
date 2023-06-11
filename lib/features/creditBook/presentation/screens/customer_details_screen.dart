import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/fireBase_fun.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/creditBook/data/customer_model.dart';
import '../../../../core/app_colors.dart';

class CustomerDetailsScreen extends StatelessWidget{

  static const String routeName = AppStrings.customer_details_screen ;


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map ;
    return SafeArea(
      child: Scaffold(
        body: Column (
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.arrow_back_ios , color: AppColors.primaryColor,)),
                FutureBuilder<CustomerModel?>(
                  future: FireBaseFun.getCustomerFromFire(args["id"]),
                    builder: (context , snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator (),
                      );
                    }else if (snapShot.hasError){
                      return Text ("Something error" , style: Theme.of(context).textTheme.bodyLarge,);
                    }else {
                      var data = snapShot.data ;
                      return Text (data!.name , style: Theme.of(context).textTheme.bodyLarge!.
                        copyWith(color: AppColors.primaryColor),);
                    }
                    } ) ,
                IconButton(onPressed: (){

                }, icon: Icon(Icons.person , color: AppColors.primaryColor,))
              ],
            )
          ],
        ),
      ),
    );
  }
}