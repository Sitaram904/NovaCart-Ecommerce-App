import 'package:flutter/material.dart';
import 'package:nova_cart/core/constants/app_colors.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final themeb = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn2nmWoa-66Yo5xylQwIiAxtvMrK2pB2l4CA&s',
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
                              'P-Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: themeb ? AppColors.white : AppColors.black,
                              ),
                            ),
                            Text(
                              'category',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.oderSummaryGrey,
                              ),
                            ),
                            Text(
                              '\$2098',
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only( right: 5,),
                       child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: AppColors.primary,
                        maximumSize: Size(150, 40)
                        ),
                        onPressed:(){
                      
                       }, child: Text('Track Order',style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                       ),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
