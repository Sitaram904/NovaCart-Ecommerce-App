import 'package:equatable/equatable.dart';

class AuthCredincialModel extends Equatable {
  final String emailAddress;
  final String? userName;
  final String password;

  const AuthCredincialModel({
    this.userName,
    required this.emailAddress,
    required this.password,
  });

  @override
  List<Object?> get props=>[emailAddress,password];


  
 AuthCredincialModel copyWith({
final String? emailAddress,
final String? password
}){
  
return AuthCredincialModel(

  emailAddress: emailAddress??this.emailAddress,
   password: password??this.password
   );
   

}


}