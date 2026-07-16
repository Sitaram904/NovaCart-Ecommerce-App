import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/common/widgets/buttons.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/core/services/add_to_cart.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_event.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';
import 'package:nova_cart/features/shop/checkout/page/checkout_page.dart';

class CartDetailsPage extends StatelessWidget {
  final String? id;

  final String productName;
  final String prodDescription;
  final double productPrice;
  final String category;
  final List<String> productImageUrl;
  final List<String> colors;
  final bool? favoriteProduct;
  final int? stock;
  final double? rating;
  final int? review;
  const CartDetailsPage({
    super.key,
    this.id,
    required this.productName,
    required this.prodDescription,
    required this.productPrice,
    required this.category,
    required this.productImageUrl,
    this.favoriteProduct,
    this.stock,
    this.rating,
    this.review, required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final themeb = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: themeb
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        leading: IconButton(
          padding: EdgeInsets.all(10),
          style: IconButton.styleFrom(backgroundColor: AppColors.white),
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.black,
            size: 20,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.offWhite,
            child: Buttons.favoriteIconBtn(
              state: favoriteProduct,
              size: 24,
              color: AppColors.primary,
              onPress: () {
                context.read<ProductsBloc>().add(
                  FavourateItemEvent(
                    favorite: favoriteProduct ?? false,
                    productId: id,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        children: [
          Hero(
            tag: productName,
            child: Container(
              clipBehavior: Clip.antiAlias,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: AppColors.white,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Image.network(
                productImageUrl[0],

                height: 400,
                width: double.infinity,

                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$$productPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: themeb ? AppColors.primaryDark : AppColors.primary,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Icon(Icons.star, color: AppColors.starYellow, size: 24),
                    SizedBox(width: 5),
                    Text(
                      '$rating',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: themeb ? AppColors.white : AppColors.black,
                      ),
                    ),
                    Text(
                      '  ( $review Review )',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'Descriptoin',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: themeb ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  prodDescription,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: themeb
                        ? AppColors.searchTextGreyDark
                        : AppColors.searchIconGrey,
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    stock == 0 ? 'Stock Not Available !' : 'Stock Available',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: stock == 0 ? AppColors.signoutRed : Colors.green,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: AppColors.primary,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CheckoutPage()),
                          );
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.all(10),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: ()async {
                       await   AddToCartServer.addProducts(
                            id: id,
                            itemCount:1,
                            productName: productName, 
                            prodDescription: prodDescription,
                             productPrice: productPrice, 
                             category:category, 
                             colors: colors,
                              productImageUrl: productImageUrl,
                              favoriteProduct: favoriteProduct,
                              review: review,
                              stock: stock,
                              rating: rating
                              
                              );
                       if(!context.mounted)return;
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              backgroundColor: Colors.green,
                              content:Text("Successfully add to cart "))
                          );
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.bagShopping,
                          color: AppColors.greyDark,
                          size: 30,
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
    );
  }
}
