class UserModel{
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phoneNumber;
  late final String password;

  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
  }
}