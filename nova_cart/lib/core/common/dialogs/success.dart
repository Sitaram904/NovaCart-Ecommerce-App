

import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

class SuccessToast {
  SuccessToast._();

  static void successSnackBar({required String content,required BuildContext context,}){
    if(!context.mounted)return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Durations.medium2,
        backgroundColor:Colors.green,
        content:Center(child: Text(content,style: TextStyle(color: AppColors.white),)))
    );
  }
}