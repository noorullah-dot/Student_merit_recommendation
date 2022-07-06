
class UserModel {
  String? uid;
  String? fullname;
  String? email;

  UserModel({this.uid,this.email,this.fullname});

//data from server
factory UserModel.fromMap(map){
  return UserModel(
    uid:map['uid'],
    email:map['email'],
    fullname:map['firstName'],
 );
}
//sending data from server
Map<String,dynamic>toMap(){
  return{
    'uid':uid,
    'email':email,
    'fullname':fullname,
  };
}



}