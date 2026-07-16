
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/core/di/injection_container.dart';
import 'package:nova_cart/core/theme/app_theme.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_bloc.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_bloc.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_state.dart';
import 'package:nova_cart/main_bloc/bottom_navigation.dart/bloc/bottom_navbar_bloc.dart';


class NovaCart extends StatelessWidget {
  const NovaCart({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (context) => SettingBloc()),
        BlocProvider(create: (context) => ProductsBloc()),
        BlocProvider(create: (context) => BottomNavbarBloc()),
      ],
      child: BlocBuilder<SettingBloc, ToggleThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            title: 'NovaCart',
            darkTheme: AppTheme.darkTheme,
            themeMode:state.isDarkMode==null?ThemeMode.system:state.isDarkMode??false? ThemeMode.dark:ThemeMode.light,
              
            debugShowCheckedModeBanner: false,
            home:StartingScreen()
          );
        },
      ),
    );
  }
}

class StartingScreen extends StatefulWidget {
  const StartingScreen({
    super.key,
  });





  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
              checkAttach(context);

      }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
