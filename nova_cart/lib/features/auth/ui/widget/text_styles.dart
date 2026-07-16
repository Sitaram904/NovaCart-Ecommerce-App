import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

 class TextStylesAuth {
  
 
 static Text text32Bold({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color:isDark?AppColors.white:AppColors.black,

  ),
  );
}
 

 static Text text16RegularGrey({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 16,
    color:isDark?AppColors.borderGray:Color(0XFF6B7280),
    fontWeight: FontWeight.normal

  ),
  );
}


 static Text text12RegularGrey({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 12,
    color:isDark?AppColors.borderGray:Color(0XFF6B7280),
    fontWeight: FontWeight.normal

  ),
  );
}

 static Text text16SemiBoldBlackW({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 16,
    color:isDark?AppColors.white:AppColors.black,
    fontWeight: FontWeight.w600

  ),
  );
}

 static Text text14SemiBoldBlack({required String text,required isDark}){
  return Text(
    
  text,
  style:TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color:isDark?AppColors.white:AppColors.black,

  ),
  );
}
 static Text text14SemiBoldPrimary({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color:isDark?AppColors.primaryDark:AppColors.primary,

  ),
  );
}

 static Text text14RegularNormal({required String text,required isDark }){
  return Text(
  text,
  style:TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color:isDark?AppColors.white:AppColors.black,

  ),
  );
}

}