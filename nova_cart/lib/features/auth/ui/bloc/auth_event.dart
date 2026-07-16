
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nova_cart/core/common/enum.dart';
import 'package:nova_cart/features/auth/data/model/auth_credincial_model.dart';

sealed class AuthEvents extends Equatable{
  @override

  List<Object?> get props => [];

}

class RegisterRequested extends AuthEvents{
  final AuthCredincialModel authInfo;
  RegisterRequested(this.authInfo);
  @override
  List<Object?>get props=>[authInfo];
}

class LoginInRequested extends AuthEvents{
  final AuthCredincialModel authInfo;
  LoginInRequested(this.authInfo);
  @override
  List<Object?>get props=>[authInfo];
}

class ResetPassword extends AuthEvents{
  final String email;
  ResetPassword(this.email);
  @override 
  List<Object?>get props=>[email];
}

class AuthUserChanged extends AuthEvents{
  final User? user;
  AuthUserChanged(this.user);
  @override
  List<Object?>get props=>[user];
}

class AuthPageChange extends AuthEvents{
  final AuthPageChangeIndex? authPageIndex;
  AuthPageChange(this.authPageIndex);
  @override
  List<Object?>get props=>[authPageIndex];
}

class GoogleSignInUp extends AuthEvents{}

class LogoutRequest extends AuthEvents{}
