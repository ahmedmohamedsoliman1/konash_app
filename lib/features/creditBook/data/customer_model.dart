class CustomerModel {

  String id ;
  String name ;
  String phone ;
  String address ;

  CustomerModel ({required this.address , required this.name ,
  required this.phone , this.id = ""});

  CustomerModel.fromJson (Map <String , dynamic>? json) :
      this (
        id : json !["id"] as String ,
        name: json ["name"] as String ,
        phone : json ["phone"] as String ,
        address: json ["address"] as String ,
) ;

  Map <String, dynamic> toJson (){

    return {
      "id" : id ,
      "name" : name ,
      "phone" : phone ,
      "address" : address
    };
  }
}