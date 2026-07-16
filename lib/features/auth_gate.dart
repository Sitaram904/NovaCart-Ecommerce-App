
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/core/common/enum.dart';
import 'package:nova_cart/core/common/widgets/bottom_navigation_bar.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/auth/data/firebase_user_details.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_bloc.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_state.dart';
import 'package:nova_cart/features/auth/ui/pages/forget_password_page.dart';
import 'package:nova_cart/features/auth/ui/pages/login_page.dart';
import 'package:nova_cart/features/auth/ui/pages/sign_up_page.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_event.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});



  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App?"),
            content: const Text("Do you really want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Yes"),
              ),
            ],
          ),
        );

        return shouldExit ?? false;
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Scaffold(
              backgroundColor:Colors.transparent,
              body: Center(child: const CircularProgressIndicator()),
            );
          }

          if (state is AuthAuthenticated) {
            FirebaseUserDetails.checkUserDetails();
    
    context.read<ProductsBloc>().add(LoadProductEvent());
  


            return Landing();
          }

          if (state is AuthPageChangeState) {
            final pages = state.authPageIndex ?? AuthPageChangeIndex.loginPage;
            switch (pages) {
              case AuthPageChangeIndex.loginPage:
                return LoginPage();
              case AuthPageChangeIndex.sighUpPage:
                return SignUpPage();
              case AuthPageChangeIndex.forgetPage:
                return ForgetPasswordPage();
            }
          }

          return Scaffold(
            body: Center(
              child: Text(
                "Something went worong!!",
                style: TextStyle(color: AppColors.signoutRedDark),
              ),
            ),
          );
        },
      ),
    );
  }
}
