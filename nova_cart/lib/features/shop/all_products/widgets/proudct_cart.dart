import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/core/common/widgets/buttons.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/core/services/add_to_cart.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_event.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';

class AllProductCart extends StatelessWidget {
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

  const AllProductCart({
    super.key,
    this.id,
    required this.favoriteProduct,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    required this.prodDescription,
    required this.category,
    required this.colors,
    this.stock,
    this.rating,
    this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white70.withAlpha(200),
      elevation: 5,

      clipBehavior: Clip.antiAlias,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                foregroundDecoration: BoxDecoration(),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Image.network(
                  productImageUrl[0],

                  height: 170,
                  width: double.infinity,

                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary.withAlpha(300),
                  child: Buttons.favoriteIconBtn(
                    state: favoriteProduct,
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
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '   $productName',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '   \$$productPrice',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () async {
                      await AddToCartServer.addProducts(
                        id: id,
                        itemCount: 1,
                        productName: productName,
                        prodDescription: prodDescription,
                        productPrice: productPrice,
                        category: category,
                        colors: colors,
                        productImageUrl: productImageUrl,
                        favoriteProduct: favoriteProduct,
                        review: review,
                        stock: stock,
                        rating: rating,
                      );
                      debugPrint('is ct: $category');
 

                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Successfully add to cart "),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.add, color: AppColors.white, size: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
