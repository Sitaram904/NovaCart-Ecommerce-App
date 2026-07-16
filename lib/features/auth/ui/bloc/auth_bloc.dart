import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nova_cart/core/common/enum.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_event.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_state.dart';
import 'package:nova_cart/features/auth/data/firebase_auth_connector.dart';
import 'package:nova_cart/features/auth/data/firebase_user_details.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    _auth.authStateChanges().listen((user) {
      add(AuthUserChanged(user));
    });
    on<AuthUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthAuthenticated(event.user!));
        
      } else {
        add(AuthPageChange(AuthPageChangeIndex.loginPage));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuthConnector.signUpConnector(
          email: event.authInfo.emailAddress,
          password: event.authInfo.password,
          userName: event.authInfo.userName
        );
        FirebaseUserDetails.checkUserDetails(userName:event.authInfo.userName);
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LoginInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuthConnector.login(
          email: event.authInfo.emailAddress,
          password: event.authInfo.password,
        );
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<ResetPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuthConnector.forgetPassword(email: event.email);
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuthConnector.logout();
        await GoogleSignIn().signOut();
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthPageChange>((event, emit){

      try {
      
        emit(AuthPageChangeState(event.authPageIndex));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });


    on<GoogleSignInUp>(FirebaseAuthConnector.googleSignInUp);

    
  }

  
}

