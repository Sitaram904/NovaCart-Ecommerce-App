import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_cart/features/auth_gate.dart';
import 'package:nova_cart/features/onboarding/pages/onboarding_screen.dart';
import 'package:nova_cart/features/shop/cart_list/data/data_source/cart_remote_datasource.dart';
import 'package:nova_cart/features/shop/cart_list/data/data_source/cart_remote_datasource_imp.dart';
import 'package:nova_cart/features/shop/cart_list/data/repository/cart_repository_imp.dart';
import 'package:nova_cart/features/shop/cart_list/domain/repositories/cart_repository.dart';
import 'package:nova_cart/features/shop/cart_list/domain/services/cart_summary_calculator.dart';
import 'package:nova_cart/features/shop/cart_list/domain/usecases/calculate_summary_usecase.dart';
import 'package:nova_cart/features/shop/cart_list/domain/usecases/decrement_item_usecase.dart';
import 'package:nova_cart/features/shop/cart_list/domain/usecases/get_cart_usecase.dart';
import 'package:nova_cart/features/shop/cart_list/domain/usecases/increment_item_usecase.dart';
import 'package:nova_cart/features/shop/cart_list/domain/usecases/remove_cart_item_usecase.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/bloc/cart_list_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {

  //---------------- Firebase ----------------//

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  //---------------- Data Source ----------------//
getIt.registerLazySingleton<CartRemoteDataSource>(
  ()=> CartRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>(), auth:getIt<FirebaseAuth>()),
);
  //---------------- Repository ----------------//

getIt.registerLazySingleton<CartRepository>(
  ()=> CartRepositoryImpl(remoteDataSource: getIt<CartRemoteDataSource>())
);
  //---------------- Services ----------------//

  getIt.registerLazySingleton<CartSummaryCalculator>(
    () => CartSummaryCalculatorImpl(),
  );

  //---------------- UseCases ----------------//

  getIt.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(
       repository: getIt<CartRepository>(),
    ),
  );


  getIt.registerLazySingleton<IncrementItemUseCase>(
    () => IncrementItemUseCase(
      repository:  getIt<CartRepository>(),
    ),
  );

  getIt.registerLazySingleton<DecrementItemUseCase>(
    () => DecrementItemUseCase(
     repository:  getIt<CartRepository>(),
    ),
  );

  getIt.registerLazySingleton<RemoveCartItemUseCase>(
    () => RemoveCartItemUseCase(
     repository:  getIt<CartRepository>(),
    ),
  );

  

  getIt.registerLazySingleton<CalculateSummaryUseCase>(
    () => CalculateSummaryUseCase(
     calculator:  getIt<CartSummaryCalculator>(),
    ),
  );

  //---------------- Bloc ----------------//

  getIt.registerFactory<CartBloc>(
    () => CartBloc(
      getCartUseCase: getIt<GetCartUseCase>(),
      incrementItemUseCase: getIt<IncrementItemUseCase>(),
      decrementItemUseCase: getIt<DecrementItemUseCase>(),
      removeCartItemUseCase: getIt<RemoveCartItemUseCase>(),
      calculateSummaryUseCase: getIt<CalculateSummaryUseCase>(),
    ),
  );
  

}

 Future<bool> getfirstAttach()async{
   final instance = await SharedPreferences.getInstance();
  return instance.getBool("isFirstAttach")??true;
}

Future<bool> changeAttach()async{
   final instance = await SharedPreferences.getInstance();
  return instance.setBool("isFirstAttach",false);
}

Future<void> checkAttach(BuildContext context)async{
  final fAttach = await getfirstAttach();
  if(!context.mounted)return ;

 fAttach?Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>OnboardingScreen())):
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AuthGate()));
  

}