import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:konash_app/features/login/data/user_model.dart';

import '../features/creditBook/data/customer_model.dart';
class FireBaseFun {

  static CollectionReference<UserModel> getCollectionFromFirebase (){
    return FirebaseFirestore.instance.collection('userPhone').withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  static Future <void> addUserPhoneToFireBase (UserModel userModel)async {
   var collection =  getCollectionFromFirebase();
   var doc = collection.doc(userModel.id);
   return await doc.set(userModel);
  }

  static Future<UserModel?> getUserPhoneFromFireBase (String userId)async{
    var documentSapShot = await  getCollectionFromFirebase().doc(userId).get();
    return documentSapShot.data();
  }

  /// addCustomer

  static CollectionReference<CustomerModel> getCustomerCollectionFromFirebase (){
    var userId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('userPhone')
        .doc(userId).collection("customer").withConverter<CustomerModel>(
      fromFirestore: (snapshot, _) => CustomerModel.fromJson(snapshot.data()),
      toFirestore: (customer, _) => customer.toJson(),
    );
  }

  static Future <void> addCustomerToFireBase (CustomerModel customerModel)async{
    var collection = getCustomerCollectionFromFirebase();
    var doc = collection.doc();
    customerModel.id = doc.id ;
    return await doc.set(customerModel);
  }

  static Future<CustomerModel?> getCustomerFromFire(String customerId)async{
   var documentSnapShot = await getCustomerCollectionFromFirebase().doc(customerId).get();
   return documentSnapShot.data();
  }
}
