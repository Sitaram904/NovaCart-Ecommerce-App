import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/all_products/bloc/product_state.dart';
import 'package:nova_cart/features/shop/all_products/bloc/products_bloc.dart';
import 'package:nova_cart/features/shop/cart_details/page/cart_details_page.dart';
import 'package:nova_cart/features/shop/all_products/widgets/proudct_cart.dart';
import 'package:nova_cart/features/shop/filters/page/search_filter.dart';

class SearchPage extends StatefulWidget {
  final String? searchText;
  final bool? arrowLeft;
  const SearchPage({super.key, this.searchText,this.arrowLeft});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  double searchOptoinHeight = 0;
  double searchOptoinonhei=530;

  @override
  void initState() {
    _searchController.text = widget.searchText ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        shadowColor:Colors.transparent,
        surfaceTintColor: Colors.transparent,
        
        toolbarHeight: 100,
        backgroundColor:Theme.of(context).brightness==Brightness.dark?AppColors.black:AppColors.white,
        leading:  widget.arrowLeft??false?   IconButton(
                        onPressed: () {
                          Navigator.canPop(context) ? Navigator.pop(context) : null;
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: AppColors.borderGrayDark,
                          size: 20,
                        ),
                      ):null,

                      title:  SizedBox(
                        height: 50,
                        child: TextFormField(
                         
                          scrollPadding: EdgeInsets.all(0),
                            controller: _searchController,
                                  
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            onChanged: (va) {
                              _searchController.text==''?
                              searchOptoinHeight=0:
                              searchOptoinHeight=searchOptoinonhei;
                                
                                  
                              setState(() {});
                            },
                            onTapUpOutside: (va) {
                              if( FocusScope.of(context).hasFocus){
                              FocusManager.instance.primaryFocus!.unfocus();
                              }
                              // searchOptoinHeight=0;
                              // setState(() {
                                
                              // });
                            },
                            onEditingComplete: (){
                              FocusManager.instance.primaryFocus!.unfocus();

                              searchOptoinHeight=0;
                              setState(() {
                                
                              });
                             

                            },
                                  
                            decoration: InputDecoration(
                              
                              hintText: 'Search here',
                              hintStyle: TextStyle(color: Colors.blueGrey),
                                  
                              filled: true,
                              fillColor: AppColors.blackDark,
                        
                              suffix: IconButton(
                                style: IconButton.styleFrom(
                                 padding: EdgeInsets.all(20),
                                 tapTargetSize:MaterialTapTargetSize.padded
                        
                                ),
                                onPressed:(){
                                _searchController.clear();
                                searchOptoinHeight=0;
                                setState(() {
                                  
                                });
                              }, icon:Icon(Icons.clear)),
                        
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: AppColors.searchIconGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                                
                              ),
                            ),
                          ),
                      ),
                      actions: [
                        IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsetsDirectional.zero,
                              
                                ),
                                onPressed: (){
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (_)=>SearchFilter()));
                                },
                                icon: FaIcon(FontAwesomeIcons.filter,color:AppColors.grey
                             ,   size: 24
                                ,))
                      ],
      ),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        minimum:EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          splashColor:Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: (){
            searchOptoinHeight=0;
            setState((){});
          },
          
        
          child: BlocBuilder<ProductsBloc, ProductState>(
                  builder: (context, state) {


                    if(state.isLoading){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
    final query = _searchController.text.trim().toLowerCase();

                     final fileteredProducts = query.isEmpty 
        ? state.products
        : state.products.where((product) {
            return product.productName.toLowerCase().trim().contains(query);
         
          }).toList();
          


          return  Stack(            
            children: [
              SizedBox.expand(
                child:
                 GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 255,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount:fileteredProducts.length,
                  itemBuilder: (context, index) {
                    final dt = fileteredProducts[index];
                          
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
                        tag: dt.id??dt.productName,
                        child: AllProductCart(
                          id:dt.id,
                           productName:dt.productName,
                          productImageUrl: dt.productImageUrl,        
                          favoriteProduct: dt.favoriteProduct ?? false,
                           prodDescription:dt.prodDescription,
                           productPrice: dt.productPrice,
                       category:dt.category , 
                       colors:dt.colors,
                       rating:dt.rating ,
                       review: dt.review,
                       stock: dt.stock,
                        ),
                      ),
                    );
                  },
                )
                
              
                
              ),
              
                
              
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                  duration: Duration(milliseconds:200),
                  height: searchOptoinHeight,
                  width: MediaQuery.of(context).size.width*0.9,
                          
                  decoration: BoxDecoration(
                  color: AppColors.offWhite,

                  borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListView.builder(
                    
                    shrinkWrap: true,
                    itemCount: fileteredProducts.length,
                    itemBuilder: (context, index) {
                      final dt =fileteredProducts[index];
                        
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                       

                          onTap: () {
                             
                            searchOptoinHeight=0;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CartDetailsPage(
                                    id: dt.id,
                                    colors: dt.colors,
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
                          leading: Icon(Icons.search),
                          subtitle: Text(dt.productName),
                          trailing: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(5),
                            child: Image.network(
                              dt.productImageUrl[0],
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
                  }
          
        ),
        
      ),

    )
    );
  }
}
