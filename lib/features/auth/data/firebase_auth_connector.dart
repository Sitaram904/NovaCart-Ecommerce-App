import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_event.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_state.dart';
import 'package:nova_cart/features/auth/data/firebase_user_details.dart';

class FirebaseAuthConnector {
  FirebaseAuthConnector._();
  static Future<void> signUpConnector({
     String? userName,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUserDetails.checkUserDetails(userName: userName);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> forgetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> googleSignInUp(
    GoogleSignInUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(AuthUnAuthenticated());
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credencial = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredentials = await FirebaseAuth.instance.signInWithCredential(
        credencial,
      );
      emit(AuthAuthenticated(userCredentials.user!));
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
    }
  }
}
