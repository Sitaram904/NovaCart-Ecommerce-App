import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_bloc.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_event.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_state.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SettingBloc, ToggleThemeState>(
          builder: (context, state) {
            return Switch(
              value: state.isDarkMode ?? false,
              onChanged: (value) {
               
                context.read<SettingBloc>().add(ToggleThemeEvent(value: value));
              },
            );
          },
        ),
      ),
    );
  }
}
