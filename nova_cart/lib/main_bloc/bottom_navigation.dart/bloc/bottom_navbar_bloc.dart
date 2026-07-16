import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarInitial> {
  BottomNavbarBloc() : super(BottomNavbarInitial(pageNumnber:0)) {
    on<BottomNavigationChangePage>(
    _pageChangesIndex
    );
  }

void _pageChangesIndex(BottomNavigationChangePage event , Emitter<BottomNavbarInitial> emit){
emit(BottomNavbarInitial(pageNumnber:event.pageNumnber));

}


}
