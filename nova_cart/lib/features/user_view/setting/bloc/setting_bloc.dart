import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_event.dart';
import 'package:nova_cart/features/user_view/setting/bloc/setting_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingBloc extends Bloc<SettingEvent, ToggleThemeState> {
  SettingBloc() : super(ToggleThemeState(isDarkMode: null)) {

    on<ToggleThemeEvent>(_toggleThemeButtonEvent);
  }

  Future<void> _toggleThemeButtonEvent (
    ToggleThemeEvent event,
    Emitter<ToggleThemeState> emit,
  )async {
     final SharedPreferences  prefs= await SharedPreferences.getInstance();
     await prefs.setBool("themeMode", event.value);
   final isDark = prefs.getBool('themeMode')??false;
    emit(state.copyWith(isDarkMode: isDark));

  }



}
