

class UserAuthDetailModel {

final String userFullName;
final String emailAddress;

final String password;

const  UserAuthDetailModel({

  required this.userFullName,
  required this.emailAddress,
  required this.password
});

UserAuthDetailModel copyWith({

final String? userFullName,
final String? emailAddress,
final String? password
}){
return UserAuthDetailModel(

 userFullName: userFullName??this.userFullName,
  emailAddress: emailAddress??this.emailAddress,
   password: password??this.password
   );
}

}