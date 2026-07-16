
// Light mode texttheme 


import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

abstract class FontsTheme {
  static TextTheme textThemeLight(){
    return TextTheme(
      
      headlineLarge: TextStyle(
        color:AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24
      ),

        headlineMedium: TextStyle(
        color:AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16
      ),
      headlineSmall: TextStyle(
        color:AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 14
      ),
    
    );
  }




  // DarkThemetext 

  static TextTheme textThemeDark(){
    return TextTheme(
      
      headlineLarge: TextStyle(
        color:AppColors.blackDark,
        fontWeight: FontWeight.w600,
        fontSize: 24
      ),
      headlineMedium: TextStyle(
        color:AppColors.blackDark,
        fontWeight: FontWeight.w600,
        fontSize: 16
      ),
      headlineSmall: TextStyle(
        color:AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 14
      ),


     
    );
  }
}

