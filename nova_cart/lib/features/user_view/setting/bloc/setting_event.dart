import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

@override  
List<Object?>get props =>[];

}

class ToggleThemeEvent extends SettingEvent{
  final bool value;
  const ToggleThemeEvent({required this.value});
@override 
List<Object?>get props =>[];
}