import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/auth/ui/widget/text_styles.dart';

 class AuthButtons {

 static ElevatedButton authButton({
  required  String btnName,
  required  bool isDark,
  required  VoidCallback onPressed

  }){
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        
        ),
        
        backgroundColor:isDark?AppColors.primaryDark:AppColors.primary
      ),
      onPressed:onPressed
      , child:TextStylesAuth.text16SemiBoldBlackW(text:btnName, isDark: !isDark));
  }




  
 static ElevatedButton authButtonsOtherLogin({
  required  String btnName,
  required IconData iconData,
  required  bool isDark,
  required  VoidCallback onPressed

  }){
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shadowColor: Colors.transparent,
        overlayColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side:BorderSide(width:1.5,color:isDark?AppColors.orderBlack:Color(0XFFE5E7EB)),
        
          ),
        
      
        
        backgroundColor:Colors.transparent
      ),
      onPressed:onPressed
      , child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(width:30,),
          FaIcon(iconData,size: 24,),
          TextStylesAuth.text16SemiBoldBlackW(text:btnName, isDark: isDark),

        ],
      ));
  }



}