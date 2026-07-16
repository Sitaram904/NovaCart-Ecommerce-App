part of 'bottom_navbar_bloc.dart';

sealed class BottomNavbarEvent extends Equatable {
  
  const BottomNavbarEvent();

  

  @override
  List<Object> get props => [];


}

class BottomNavigationChangePage extends BottomNavbarEvent{
final int pageNumnber;

const BottomNavigationChangePage({required this.pageNumnber});
@override
List<Object> get props => [pageNumnber];

  BottomNavigationChangePage copyWith({final int? pageNumnber}){
    return BottomNavigationChangePage(pageNumnber: pageNumnber??this.pageNumnber);
  }

}
