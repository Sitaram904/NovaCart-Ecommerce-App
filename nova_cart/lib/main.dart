import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_cart/app.dart';
import 'package:nova_cart/core/di/injection_container.dart';
import 'package:nova_cart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initDependencies();
    



  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(NovaCart());

}
