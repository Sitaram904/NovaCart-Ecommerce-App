

import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

abstract class Buttons {
  //FavoriteButton start
static  IconButton favoriteIconBtn({VoidCallback? onPress,Color? color, bool? state,double? size}){
    return IconButton(onPressed:onPress, icon:state??false?Icon(Icons.favorite,color:color??AppColors.primary,size:size??24,):Icon(Icons.favorite_outline,color:AppColors.primary));
  }
  // end 

  static ElevatedButton buttonPrimary({required Color color,VoidCallback? opPressed,required String btnName}){
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        backgroundColor:color,
        
      ),
      onPressed:opPressed, child:Text(btnName,

    ));
  }



}