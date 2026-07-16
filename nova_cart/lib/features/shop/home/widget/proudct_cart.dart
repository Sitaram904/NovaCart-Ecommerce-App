import 'package:flutter/material.dart';
import 'package:nova_cart/core/common/widgets/buttons.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

class ProudctCart extends StatefulWidget {
  final String productImageUrl;
  final String productName;
  final double productPrice;
  final bool favoriteProduct;
  const ProudctCart({
    super.key,
    required this.favoriteProduct,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<ProudctCart> createState() => _ProudctCartState();
}

class _ProudctCartState extends State<ProudctCart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 130,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Theme.of(context).colorScheme.surface,
          elevation: 2,
          shadowColor: AppColors.primaryDark,
        
          clipBehavior: Clip.antiAlias,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.black87.withAlpha(60),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    child: Image.network(
                      height: 100,
                      width: double.infinity,

                      repeat: ImageRepeat.noRepeat,
                      fit: BoxFit.cover,
                      widget.productImageUrl,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Buttons.favoriteIconBtn(
                      state: widget.favoriteProduct,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),

              Text(
                '  ${widget.productName}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '  \$${widget.productPrice}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
