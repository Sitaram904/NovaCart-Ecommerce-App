
import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/all_products/page/all_products.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(Icons.safety_check ,size: 50,color: AppColors.primaryDark,),
        Text("add any product!",
        style: TextStyle(color:AppColors.doteGrey,
        fontWeight: FontWeight.normal,
        fontSize: 16
        ),
        ),
        ElevatedButton(onPressed:(){
         Navigator.push(context,MaterialPageRoute(builder: (_)=>AllProducts()));
        }, child:Text('Shop Now'))
      ],
    ),);
  }
}
