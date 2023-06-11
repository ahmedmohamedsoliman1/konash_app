import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_colors.dart';
import 'package:konash_app/features/creditBook/presentation/screens/add_customer.dart';
import 'package:provider/provider.dart';
import '../../../../config/user_provider.dart';

class CreditBookScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
      child: Column (
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon (Icons.youtube_searched_for , color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon (Icons.visibility , color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon (Icons.web , color: Colors.white,),
                  ),
                ],
              ) ,
              Row(
                children: [
                  Text (provider.userModel!.phone , style: TextStyle (
                    color: Colors.black
                  ),) ,
                  SizedBox(width: 10,),
                  Icon(Icons.file_copy_sharp , color: AppColors.primaryColor,)
                ],
              )
            ],
          ) ,
           SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Image(image: AssetImage ("assets/images/page2.png") , width: 200 ,
              height: 200,),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Text ("Here, you can register all the credits of your customers and suppliers",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black , fontSize: 16 , fontWeight: FontWeight.normal
          ), textAlign: TextAlign.center,),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Icon(Icons.arrow_drop_down_circle_rounded , color: Colors.yellowAccent[700],),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),

          Row(
            children: [
              Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, ChoiceCreateOrImportCustomerScreen.routeName);
                    }, child: Text ("ADD CUSTOMER") , style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor
                    ),),
                  )),
              SizedBox(width: 10,),
              Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(onPressed: (){

                    }, child: Text ("ADD SUPPLIER") , style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor
                    ),),
                  )),
            ],
          )

        ],
      ),
    );
  }
}