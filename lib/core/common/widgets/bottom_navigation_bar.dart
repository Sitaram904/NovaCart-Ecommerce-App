
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/page/cart_list_page.dart';
import 'package:nova_cart/features/shop/home/pages/home_page.dart';
import 'package:nova_cart/features/shop/search/pages/search_page.dart';
import 'package:nova_cart/features/user_view/page/user_view.dart';
import 'package:nova_cart/main_bloc/bottom_navigation.dart/bloc/bottom_navbar_bloc.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Widget> pages = [HomePage(), SearchPage(), CartListPage(), UserView()];
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final blocContainer = context.watch<BottomNavbarBloc>();

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        minimum: EdgeInsets.all(10),
        child: IndexedStack(
          index: blocContainer.state.pageNumnber,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 50,
          indicatorColor: Colors.transparent,

          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        child: NavigationBar(
          onDestinationSelected: (value) {
            context.read<BottomNavbarBloc>().add(
              BottomNavigationChangePage(pageNumnber: value),
            );
          },

          selectedIndex: blocContainer.state.pageNumnber,
          destinations: [
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.houseChimney,
                size: 24,
                color: themeColor.outlineVariant,
              ),
              selectedIcon: FaIcon(
                FontAwesomeIcons.houseChimney,
                size: 24,
                color: themeColor.primary,
              ),
              label: '',
              tooltip: 'home',
            ),
            NavigationDestination(
              icon: FaIcon(
                Icons.search_rounded,
                size: 35,
                color: themeColor.outlineVariant,
              ),
              selectedIcon: FaIcon(
                Icons.search_rounded,
                size: 35,
                color: themeColor.primary,
              ),
              label: '',
              tooltip: 'search',
            ),
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.bagShopping,
                size: 24,
                color: themeColor.outlineVariant,
              ),
              selectedIcon: Icon(
                FontAwesomeIcons.bagShopping,
                size: 24,
                color: themeColor.primary,
              ),
              label: '',
              tooltip: 'products',
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.solidUser,
                size: 24,
                color: themeColor.outlineVariant,
              ),
              selectedIcon: FaIcon(
                FontAwesomeIcons.solidUser,
                size: 24,
                color: themeColor.primary,
              ),
              label: '',
              tooltip: 'userInfo',
            ),
          ],
        ),
      ),
    );
  }
}
