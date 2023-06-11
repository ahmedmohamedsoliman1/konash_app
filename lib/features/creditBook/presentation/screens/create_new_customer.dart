import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/fireBase_fun.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/creditBook/data/customer_model.dart';
import 'package:konash_app/features/creditBook/presentation/screens/customer_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/textEditWidget.dart';
import 'Create_new_customer_navigator.dart';
import 'create_new_customer_viewModel.dart';

class CreateNewCustomer extends StatefulWidget {
  static const String routeName = AppStrings.create_customer;

  @override
  State<CreateNewCustomer> createState() => _CreateNewCustomerState();
}

class _CreateNewCustomerState extends State<CreateNewCustomer> implements CreateCustomerNavigator{
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  String phone = "";

  String name = "";

  String address = "";

  var formKey = GlobalKey<FormState>();

  CreateNewCustomerViewModel viewModel = CreateNewCustomerViewModel();

  @override
  void initState() {
    viewModel.navigator = this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as Map ;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ADD CUSTOMER",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      "NAME",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                TextEditWidget(
                  hint: "Name",
                  onChanged: (text) {
                    name = text;
                  },
                  controller: nameController,
                  type: TextInputType.text,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter name";
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
                      "PHONE NUMBER",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                TextEditWidget(
                  hint: "phone number",
                  onChanged: (text) {
                    phone = text;
                  },
                  controller: phoneController,
                  type: TextInputType.phone,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter name";
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
                      "ADDRESS",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                TextFormField(
                  controller: addressController,
                  onTap: () {
                    showDialog(context: context,
                        builder: (context) => AlertDialog(
                          content: BottomSheetWidget(mainAddressController:
                          addressController,),
                        ));

                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (context) => BottomSheetWidget(mainAddressController:
                    //       addressController,));
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: addressController.text == "" ? "address" :
                      addressController.text,
                      hintText: "address",
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25,
                        color: AppColors.primaryColor,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate() == true && addressController.text != ""){
                       addCustomer();
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
        ),
      ),
    );
  }

  void addCustomer (){
    viewModel.addCustomerFun(name, phone, addressController.text);
  }

  @override
  void navigateToCustomerDetails(CustomerModel customerModel) {
   Navigator.pushNamed(context, CustomerDetailsScreen.routeName ,
   arguments: {
     "id" : customerModel.id
   });
  }
}
