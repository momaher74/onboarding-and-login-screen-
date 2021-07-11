class ShopLoginScreen {
  bool status ;
  String message ;
  UserData data ;
  //named construct
  ShopLoginScreen.fromJson(json){
    status   = json['status'];
    message  = json['message'];
 data  = json['data']!=null ?UserData.fromJson(json['data']):null;
  }

}
class UserData {

  int id ;
 String name ;
 String email ;
 int phone ;
  String image ;
  String token ;

UserData({this.id, this.name, this.email, this.phone, this.image, this.token});

UserData.fromJson(json){
id = json['id'];
name = json['name'];
email = json['email'];
phone =json['phone'];
image  = json['image'];
token =   json['token'];

}


}
