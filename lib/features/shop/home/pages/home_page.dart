import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/all_products/data/allproductsdata.dart';
import 'package:nova_cart/features/shop/all_products/page/all_products.dart';
import 'package:nova_cart/features/auth/data/firebase_user_details.dart';
import 'package:nova_cart/features/shop/home/widget/carousel_widget.dart';
import 'package:nova_cart/features/shop/home/widget/proudct_cart.dart';
import 'package:nova_cart/features/shop/notefication/pages/notification_screen.dart';
import 'package:nova_cart/features/shop/search/pages/search_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String? userName;
  String? userImage;

  @override
  void initState() {
    super.initState();
    getUserdetail();
  }

  Future<void> getUserdetail() async {
    userImage = await GetFireStoreData.getUserImage();
    userName = await GetFireStoreData.getUserName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return ListView(
      
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          
          contentPadding: EdgeInsets.only(left: 0),
          horizontalTitleGap: 0,
    
          leading: CircleAvatar(
            radius: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                userImage ??
                    "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
          title: Text(
            'Hello!',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: themeColor.shadow,
              fontSize: 12,
            ),
          ),
          subtitle: Text(
            userName ?? "UserName",
    
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: themeColor.shadow,
              fontSize: 14,
            ),
          ),
          trailing: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: themeColor.surfaceContainerHighest,
              padding: EdgeInsets.only(
                top: 16,
                bottom: 25,
                left: 20,
                right: 20,
              ),
            ),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_)=>NotificationScreen()));
            },
            icon: FaIcon(
              FontAwesomeIcons.solidBell,
              color: AppColors.borderGrayDark,
              size: 20,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: _searchController,
    
            onEditingComplete: () {
              FocusManager.instance.primaryFocus!.unfocus();
              final searchText = _searchController.text.toString().trim();
              if (searchText.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage(
                        searchText: searchText,
                        arrowLeft: true,
                      );
                    },
                  ),
                );
              }
            },
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
    
            decoration: InputDecoration(
              hintText: 'Search here',
              hintStyle: TextStyle(color: Colors.blueGrey),
              suffix: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () => _searchController.clear(),
                icon: Icon(Icons.clear, color: Colors.black),
              ),
    
              filled: true,
              fillColor: themeColor.surfaceContainerHighest,
              prefixIcon: IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus!.unfocus();
    
                  final searchText = _searchController.text.toString().trim();
                  if (searchText.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchPage(searchText: searchText);
                        },
                      ),
                    );
                  }
                },
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
        SizedBox(height: 10),
    
        CarouselWidget(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured', style: Theme.of(context).textTheme.headlineMedium),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AllProducts();
                    },
                  ),
                );
              },
              child: Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            height: 170,
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: AllProductsData.allProducts.length,
              itemBuilder: (context, index) {
                final an = AllProductsData.allProducts;
                return ProudctCart(
                  productImageUrl:AllProductsData.allProducts[index].productImageUrl[0],
                  productName:an[index].productName,
                  productPrice:an[index].productPrice,
                  favoriteProduct:an[index].favoriteProduct ?? false,
                );
              },
            ),
          ),
        ),
    
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Popular',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AllProducts();
                    },
                  ),
                );
              },
              child: Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            height: 180,
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
    
              itemCount: AllProductsData.getFeature2.length,
              itemBuilder: (context, index) {
                final an =AllProductsData.getFeature2;
                return ProudctCart(
                  productImageUrl:
                    an[index].productImageUrl[0],
                  productName:an[index].productName,
                  productPrice: an[index].productPrice,
                  favoriteProduct:
                   an[index].favoriteProduct ?? false,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
