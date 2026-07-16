import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_state.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';
import 'package:nova_cart/features/shop/all_products/widgets/proudct_cart.dart';
import 'package:nova_cart/features/shop/cart_details/page/cart_details_page.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
 
 

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.all(10),
          style: IconButton.styleFrom(
            backgroundColor: themeColor.colorScheme.surfaceContainerHighest,
          ),
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.black,
            size: 24,
          ),
        ),
        centerTitle: true,
        title: Text('All Products', style: themeColor.textTheme.headlineMedium),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child:
        BlocBuilder<ProductsBloc,ProductState>(builder:(context,state){
         if(state.isLoading){
          return Center(child:CircularProgressIndicator(),);
         }
         return   GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 255,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount:state.products.length,
          itemBuilder: (context, index) {
            final dt =  state.products[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {

                      return CartDetailsPage(
                        id: dt.id,
                        colors:dt.colors,
                        productName: dt.productName,
                        prodDescription: dt.prodDescription,
                        productPrice: dt.productPrice,
                        category: dt.category,
                        productImageUrl: dt.productImageUrl,
                        rating: dt.rating,
                        review: dt.review,
                        stock: dt.stock,
                        favoriteProduct: dt.favoriteProduct,
                      );
                    },
                  ),
                );

              },
              child: Hero(
                tag:state.products[index].id??state.products[index].productName,
                child: AllProductCart(
                  id:state.products[index].id,
                  productImageUrl:state.products[index].productImageUrl,
                  productName: state.products[index].productName,
                  productPrice: state.products[index].productPrice,
                  favoriteProduct:
                      state.products[index].favoriteProduct ??
                      false, 
                      prodDescription:dt.prodDescription,
                       category:dt.category , 
                       colors:dt.colors,
                       rating:dt.rating ,
                       review: dt.review,
                       stock: dt.stock,
                       
                ),
              ),
            );
          },
        );
        })
        
        
      
      ),
    );
  }
}
