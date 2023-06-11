class UserModel {

  String phone ;

  String id ;

  UserModel ({required this.id , required this.phone});


   UserModel.fromJson (Map <String , dynamic>? json)
  : this (
     id: json !["id"] as String ,
     phone: json ["phone"] as String
   );


   Map <String , dynamic> toJson() {
   return {
     "id" : id ,
     "phone" : phone
   };
}
}