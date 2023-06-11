import 'package:flutter/cupertino.dart';
import 'package:konash_app/features/creditBook/data/customer_model.dart';
import '../../../../config/fireBase_fun.dart';
import 'Create_new_customer_navigator.dart';

class CreateNewCustomerViewModel extends ChangeNotifier {

  late CreateCustomerNavigator navigator ;


  void addCustomerFun (String name , String phone , String address)async{
    CustomerModel customerModel = CustomerModel(address: address, name: name, phone: phone);
    try {
    await FireBaseFun.addCustomerToFireBase(customerModel).then((value)
    => navigator.navigateToCustomerDetails(customerModel));
    }catch (e){
      rethrow ;
    }
  }
}