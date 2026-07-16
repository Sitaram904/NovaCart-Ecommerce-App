
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/cart_list/presentation/page/cart_list_page.dart';
import 'package:nova_cart/features/user_view/orders/pages/oders_page.dart';

class AppBarCT extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCT({
    super.key,
    required this.themeb,
    required this.widget,
  });

  final bool themeb;
  final CartListPage widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: themeb
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      leading: widget.isFromNext ?? false
          ? IconButton(
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
            )
          : SizedBox(),
      title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color.fromARGB(49, 167, 166, 166),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_)=>OdersPage()));
            },
            icon: Icon(
              Icons.more_vert,
              color: themeb ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ],
      surfaceTintColor: Colors.transparent,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(50);
}
