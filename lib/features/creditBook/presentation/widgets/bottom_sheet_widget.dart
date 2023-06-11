import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/features/creditBook/presentation/screens/create_new_customer.dart';
import 'package:konash_app/features/creditBook/presentation/widgets/textEditWidget.dart';

import '../../../../core/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {

  TextEditingController addressSheetController = TextEditingController();
  TextEditingController citySheetController = TextEditingController();
  TextEditingController countrySheetController = TextEditingController();

  String address = "" ;
  String city = "" ;
  String country = "" ;

  TextEditingController mainAddressController ;

  BottomSheetWidget ({required this.mainAddressController});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: MediaQuery.of(context).size.width*0.7,
      height: MediaQuery.of(context).size.height*0.7,
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "ADDRESS",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            TextEditWidget(
              onChanged: (text){
                address = text ;
              },
              hint: "address",
              controller: addressSheetController,
              type: TextInputType.text,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter address";
                } else {
                  null;
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Text(
                  "CITY",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            TextEditWidget(
              onChanged: (text){
                city = text ;
              },
              hint: "city",
              controller: citySheetController,
              type: TextInputType.text,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter city";
                } else {
                  null;
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Text(
                  "COUNTRY",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            TextFormField(
              onChanged: (text){
                country = text ;
                print("done");
              },
              controller: countrySheetController,
              keyboardType: TextInputType.text,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter country";
                } else {
                  null;
                }
              },
              decoration: InputDecoration(
                hintText: "country",
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() == true){
                    Navigator.pop(context , {
                      "addressSheet" : address ,
                      "city" : city ,
                      "country" : country
                    });
                    mainAddressController.text = "${address} , ${city} , ${country}" ;
                  }
                },
                child: Text(
                  "VALIDATE",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
