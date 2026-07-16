
import 'package:flutter/widgets.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

class ErrorCart extends StatelessWidget {
  const ErrorCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Something went wrong!!",style: TextStyle(
      color:AppColors.signoutRed,
      fontWeight: FontWeight.bold
    ),),);
  }
}
