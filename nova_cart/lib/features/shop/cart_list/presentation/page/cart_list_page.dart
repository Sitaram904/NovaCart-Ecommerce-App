import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/core/di/injection_container.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/bloc/cart_list_bloc.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/bloc/cart_list_event.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/bloc/cart_list_state.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/widgets/app_bar.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/widgets/empty_cart.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/widgets/error_cart.dart';
import 'package:nova_cart/features/shop/checkout/page/checkout_page.dart';

class CartListPage extends StatefulWidget {
  final bool? isFromNext;
  const CartListPage({super.key, this.isFromNext});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {

  @override
  Widget build(BuildContext context) {
    final themeb = Theme.of(context).brightness == Brightness.dark;
    return  BlocProvider(create:(_)=>getIt<CartBloc>()..add(CartStarted())  ,
    child: Scaffold(
      appBar: AppBarCT(themeb: themeb, widget: widget),

      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 200),
        child:BlocBuilder<CartBloc,CartState>(
 
          builder: (context, state) {
      
            if(state.status == CartStatus.loading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }


            if(state.cartItems.isEmpty){
              return EmptyCart();
            }
  
            if( state.cartItems.isNotEmpty){
                
              final items = state.cartItems;
              return ListView.builder(
                itemCount:items.length,
                itemBuilder:(context,index){
            final item = items[index];
                return SizedBox(
              height: 110,
              width: double.infinity,
              child: Card(
                color: themeb
                    ? const Color.fromARGB(229, 0, 0, 0)
                    : AppColors.offWhite,

                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.network(
                               item.images[0],
                              height: 126,
                              width: 99,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                              item.productName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: themeb
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              Text(
                              item.category,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColors.oderSummaryGrey,
                                ),
                              ),
                              Text(
                                 item.price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: themeb
                                      ? AppColors.primaryDark
                                      : AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                          right: 20,
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                   onTap: () {
                                    
                                  final cartId = item.id;
                                  context.read<CartBloc>().add(CartRemovePressed(cartId));
                                                      
                  
                                      
                                },
                                child: FaIcon(
                                  size: 25,
                                  FontAwesomeIcons.trashCan,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.error.withAlpha(160),
                                ),
                              ),
                            ),
                            Row(
                              spacing: 15,

                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: InkWell(
                                    onTap: () {
                                  final cartId = item.id;
                                    
                                     context.read<CartBloc>().add(CartDecrementPressed(cartId));
                                       
                                      
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      child: Icon(
                                        Icons.remove_rounded,
                                        color: AppColors.white,
                                        size: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                              item.quantity.toString(),
                                  style: TextStyle(
                                    color: themeb
                                        ? AppColors.white
                                        : AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: InkWell(
                                    onTap: (){
                                      final cartId =  item.id;
                                    context.read<CartBloc>().add(CartIncrementPressed(cartId));

                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: AppColors.white,
                                        size: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
              });
            }

              return ErrorCart();
          },
        ),
      ),

      bottomSheet: BlocBuilder<CartBloc,CartState>(
        builder: (context,state) {
          if(state.cartItems.isEmpty){
            return SizedBox();
          }
          return  Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(bottom:40,),
            decoration: BoxDecoration(),
            height: 240,
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: 200,
                    // width:MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                      color: themeb ? AppColors.black : AppColors.offWhite,
                      boxShadow: [
                        BoxShadow(color: AppColors.borderGray,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(10, -1))
                      ],
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                      children: [
                        Align(
                          
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.left,
                            'Order Summary',
                            style: TextStyle(
                              color: themeb ? AppColors.white : AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Items',
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              state.cartItems.length.toString(),
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),   
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                             state.summary.subtotal.toString(),
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                            state.summary.discount.toStringAsFixed(2),
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charges',
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                            state.summary.deliveryCharge.toString(),
                              
                              style: TextStyle(
                                color: AppColors.searchIconGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                            state.summary.total.toString(),
                              
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 200,
                    // width:MediaQuery.of(context).size.width*0.3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsetsDirectional.zero,
                        backgroundColor: AppColors.primary,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(_)=>CheckoutPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
          
                              borderRadius: BorderRadiusGeometry.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart_checkout_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
          
                              borderRadius: BorderRadiusGeometry.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
             
          );
        }
      ),
      backgroundColor: Colors.transparent,
      extendBody: false,
    )
    );
  }
}
