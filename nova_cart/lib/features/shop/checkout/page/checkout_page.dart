import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/common/dialogs/success.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/checkout/paymentgetways/esewa/esewa_page.dart';
enum PaymentMethod{esewa,khalti,cash}

class CheckoutPage extends StatefulWidget {

  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
   PaymentMethod? selectedMethod;
  @override
  Widget build(BuildContext context) {
    final themeb = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Text(
          'Check Out',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    child: FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '325 15th Eighth Avenue, NewYork',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Saepe eaque fugiat ea voluptatum veniam.',
                        style: TextStyle(
                          color: AppColors.botomIconGreyDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    child: FaIcon(
                      FontAwesomeIcons.clock,
                      size: 24,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          
                  Text(
                    '6:00 pm, Wednesday 20',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(height: 50),
          
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 200,
                // width:MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                  color: themeb ? AppColors.black : AppColors.offWhite,
          
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        'Order Summary',
                        style: TextStyle(
                          color: themeb ? AppColors.white : AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$423',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$4',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charges',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$2',
                          style: TextStyle(
                            color: AppColors.searchIconGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$423',
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Choose payment method',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              getPaymentMethod(methodImage:'https://premiumnepal.com/wp-content/uploads/2023/11/khaltiicon.png',
              methodName:'Khalti',
              value: PaymentMethod.khalti 
              ),
           
             getPaymentMethod(methodImage:'https://play-lh.googleusercontent.com/MRzMmiJAe0-xaEkDKB0MKwv1a3kjDieSfNuaIlRo750_EgqxjRFWKKF7xQyRSb4O95Y',
              methodName: 'E-Sewa', value: PaymentMethod.esewa),
             
             getPaymentMethod(methodImage:'https://static.vecteezy.com/system/resources/thumbnails/073/076/738/small/3d-cash-stack-finance-money-concept-png.png',
          
              methodName: 'Cash', 
              value: PaymentMethod.cash),
              SizedBox(height: 20,)
              ,
              InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
          
             
              },
              child:    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               
          
                  Text(
                    'Add new payment method',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                    )
                  ),
               CircleAvatar(
                  backgroundColor: AppColors.offWhite,
                  radius: 16,
                  child: FaIcon(FontAwesomeIcons.plus,color:AppColors.primary,size: 16,))
                ],
              )
            ),
          
            SizedBox(height: 20,),
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50)
              ),
              onPressed:(){
               if(selectedMethod==PaymentMethod.esewa){
                PaymentScreen().payWithEsewa();
               }
               SuccessToast.successSnackBar(content: "Checkout Successfully ", context: context);

              }, child:Text('Check Out',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
              ,color: AppColors.white
            ),
            ))
          
          
            ],
          ),
        ),
      ),


    );
 
 
  }
    

  Widget getPaymentMethod({required String methodImage,required String methodName,required PaymentMethod value}){
  final isSelected = selectedMethod ==value;
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: (){
setState(() {
  selectedMethod=value;
});
           
    },
    child:    Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                spacing:20,
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                    padding: EdgeInsets.all(2),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                    color: AppColors.white
                   
                    ),
                     child: Image.network(methodImage
                     ,height: 30,
                     width: 30,
                     fit:BoxFit.cover,
                     ),
                   ),
                 
               
                              
                              
               
               Text(
                methodName,
                style: TextStyle(
                  color: AppColors.doteGreyDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                )
                               ),
                 ]),
               
              
             
              isSelected? CircleAvatar(
                backgroundColor: AppColors.offWhite,
                radius: 16,
                child: FaIcon(FontAwesomeIcons.check,color:AppColors.primary,size: 16,)):SizedBox()
              ],
            )
  );
 }
}
