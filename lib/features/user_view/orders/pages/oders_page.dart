import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/user_view/orders/pages/active_order.dart';

class OdersPage extends StatefulWidget {
  const OdersPage({super.key});

  @override
  State<OdersPage> createState() => _OdersPageState();
}

class _OdersPageState extends State<OdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar:AppBar(
        title: Text('Orders',style:Theme.of(context).textTheme.headlineMedium),
        bottom: TabBar(
          dividerHeight: 0,
          indicatorSize:TabBarIndicatorSize.tab,
         unselectedLabelColor:AppColors.borderGrayDark,
         labelColor: AppColors.black,
         labelStyle: Theme.of(context).textTheme.headlineSmall,
  
          splashBorderRadius: BorderRadius.circular(10),
          indicator:UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primary,width: 3,),
            borderRadius: BorderRadius.circular(5)
            

          ),
          indicatorPadding: EdgeInsetsGeometry.only(bottom:10),

          tabs:[
            Tab(text:'Active' ,),
            Tab(text:'Completed' ,),
            Tab(text:'Cancle' ,),
        ]),
      ),
      body:TabBarView(children:[
       ActiveOrder(),
        Container(),
        Container(),
      ]),
    ));
  }
}