part of 'bottom_navbar_bloc.dart';



 class BottomNavbarInitial extends Equatable {
  final int pageNumnber;
  const BottomNavbarInitial({required this.pageNumnber});
  BottomNavbarInitial copyWith({final int? pageNumnber}){
    return BottomNavbarInitial(pageNumnber:pageNumnber??this.pageNumnber);
    
  }
  
  @override
  List<Object> get props => [pageNumnber];
}

