import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nova_cart/core/common/enum.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthAuthenticated extends AuthState{
  final User? user;
  AuthAuthenticated(this.user);
@override
  List<Object?> get props=>[user];
}

class AuthUnAuthenticated extends AuthState{}

class AuthError extends AuthState{
  final String? error;
  AuthError(this.error);
  @override  
  List<Object?>get props=>[error];
}


class AuthPageChangeState extends AuthState{
  final AuthPageChangeIndex? authPageIndex;
  AuthPageChangeState(this.authPageIndex);

  @override
  List<Object?>get props=>[authPageIndex];
}