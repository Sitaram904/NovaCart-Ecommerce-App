import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/core/theme/text_theme.dart';

abstract class AppTheme {

  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor:Colors.transparent
    ),
    fontFamily: 'Poppins',

    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme:ColorScheme(
    brightness: Brightness.light,
    
  primary: AppColors.primary,
  onPrimary: AppColors.white,

  secondary: AppColors.grey,
  onSecondary: AppColors.black,

  error: AppColors.deletRed,
  onError: AppColors.white,

  surface: AppColors.white,
  onSurface: AppColors.black,

  primaryContainer: AppColors.offWhite,
  onPrimaryContainer: AppColors.black,

  secondaryContainer: AppColors.borderGray,
  onSecondaryContainer: AppColors.black,

  errorContainer: AppColors.signoutRed,
  onErrorContainer: AppColors.white,

  surfaceContainerHighest: AppColors.offWhite,
  onSurfaceVariant: AppColors.searchTextGrey,

  outline: AppColors.borderGray,
  outlineVariant: AppColors.doteGrey,

  shadow: AppColors.black,
  scrim: AppColors.black,

  inverseSurface: AppColors.white,
  onInverseSurface: AppColors.white,
  inversePrimary: AppColors.orderBlack,
     ),

    
    
    
    

    scaffoldBackgroundColor:AppColors.white,
    
     textTheme: FontsTheme.textThemeLight()
  );
 

//  darkmode 
  static ThemeData darkTheme=ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor:Colors.transparent
    ),
    textTheme:FontsTheme.textThemeDark(),
        fontFamily: 'Poppins',
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme(brightness: Brightness.dark,
  primary: AppColors.primaryDark,
  onPrimary: AppColors.blackDark,

  secondary: AppColors.greyDark,
  onSecondary: AppColors.blackDark,

  error: AppColors.deletRedDark,
  onError: AppColors.blackDark,

  surface: AppColors.blackDark,
  onSurface: AppColors.whiteDark,

  primaryContainer: AppColors.orderBlackDark,
  onPrimaryContainer: AppColors.whiteDark,

  secondaryContainer: AppColors.borderGrayDark,
  onSecondaryContainer: AppColors.whiteDark,

  errorContainer: AppColors.signoutRedDark,
  onErrorContainer: AppColors.blackDark,

  surfaceContainerHighest: AppColors.orderBlackDark,
  onSurfaceVariant: AppColors.searchTextGreyDark,

  outline: AppColors.borderGrayDark,
  outlineVariant: AppColors.doteGreyDark,

  shadow: AppColors.blackDark,
  scrim: AppColors.blackDark,

  inverseSurface:Colors.black,
  onInverseSurface: AppColors.blackDark,
  inversePrimary: AppColors.primaryDark,),
  scaffoldBackgroundColor:AppColors.black
  );
  
  }