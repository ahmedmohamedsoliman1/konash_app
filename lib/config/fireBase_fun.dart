import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konash_app/features/login/data/user_model.dart';
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
}