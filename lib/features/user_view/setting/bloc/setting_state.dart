
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingState extends Equatable{
  const SettingState();
@override
List<Object?>get props =>[];
}

class ToggleThemeState extends SettingState{

  final bool? isDarkMode;
  const ToggleThemeState({
    required this.isDarkMode
  });

  @override 

  List<Object?> get props=>[isDarkMode];

  ToggleThemeState copyWith(
    {
      ThemeData? themeData,bool? isDarkMode
    }
  ){
  return ToggleThemeState(
   isDarkMode: isDarkMode??this.isDarkMode,
  );
  }
}