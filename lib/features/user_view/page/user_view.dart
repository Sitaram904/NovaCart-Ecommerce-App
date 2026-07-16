import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/admin/add_products.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_bloc.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_event.dart';
import 'package:nova_cart/features/auth/data/firebase_user_details.dart';
import 'package:nova_cart/features/user_view/setting/page/setting.dart';
import 'package:nova_cart/main_bloc/bottom_navigation.dart/bloc/bottom_navbar_bloc.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String? userName;
  String? email;
  String? userImage;

  @override
  void initState() {
    super.initState();
    getUserdetail();
  }

  Future<void> getUserdetail() async {
    userImage = await GetFireStoreData.getUserImage();
    userName = await GetFireStoreData.getUserName();
    email = await GetFireStoreData.getUserEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Flex(
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          spacing: 15,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    userImage ??
                        "https://lh3.googleusercontent.com/a/ACg8ocL_mxeC92jMUVJKmp7zCp38FIqmBf7KVoy6ydyAvgVtEMha-i5z=s96-c",
                  ),
                ),
                Text(
                  userName ?? "User",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  email ?? "user@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.greyDark,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            listTiles(
              onTap: () {},
              pName: "User Details",
              uIcon: FontAwesomeIcons.solidUser,
              context: context,
            ),
            listTiles(
              onTap: () {
                debugPrint("hello world man");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SettingPage()),
                );
              },
              pName: 'Setting',
              uIcon: FontAwesomeIcons.gear,
              context: context,
            ),
            listTiles(
              onTap: () {},
              pName: 'Contact',
              uIcon: FontAwesomeIcons.solidEnvelope,
              context: context,
            ),
            listTiles(
              onTap: () {},
              pName: 'Share App',
              uIcon: FontAwesomeIcons.shareNodes,
              context: context,
            ),
            listTiles(
              onTap: () {
                AddProducts().addProducts();
              },
              pName: 'Help',
              uIcon: FontAwesomeIcons.solidCircleQuestion,
              context: context,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequest());
                context.read<BottomNavbarBloc>().add(
                  BottomNavigationChangePage(pageNumnber: 0),
                );



              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.signoutRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Listtiles
  }

  Widget listTiles({
    required VoidCallback onTap,
    required String pName,
    required IconData uIcon,
    required BuildContext context,
  }) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.offWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      leading: FaIcon(uIcon, size: 24, color: AppColors.offWhiteDark),
      title: Text(pName, style: Theme.of(context).textTheme.headlineSmall),
      trailing: FaIcon(
        Icons.keyboard_arrow_right,
        size: 25,
        fontWeight: FontWeight.w100,
        color: AppColors.black,
      ),
    );
  }
}
