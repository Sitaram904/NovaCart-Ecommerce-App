import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/shop/search/pages/search_page.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  // genderToggleStart 
  static const List<String> genders = ['All', 'Men', 'Women'];
  String selectedGender = 'All';
  // genderToggleEnd

  // BrandToggleStart 
  List<Map<String,bool>> brands = [
   {'Adidas':true},
   {'Puma':true},
   {'Nike':true},
   {'Yeezy':true},
   {'Supreme':true},
   {'CR7':true}
   ];
  // BrandToggleEnd

  // ColorToggleStart 
  List<Map<String,bool>> colorsFilter = [
   {'White':true},
   {'Black':true},
   {'Red':true},
   {'Yellow':true},
   {'Green':true},
   {'Orange':true}
   ];
  // ColorToggleEnd

RangeValues currentValue = RangeValues(1.0, 500.0);

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.all(10),
          style: IconButton.styleFrom(
            backgroundColor: themeColor.surfaceContainerHighest,
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
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text('Gender', style: Theme.of(context).textTheme.headlineMedium),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: List.generate(genders.length, (index) {
                final isSelectedGender = genders[index] == selectedGender;
                return Expanded(
                  child: getAllChips(
                    onPressed: (){
                    selectedGender=genders[index];
                    setState(() {
                    });
                    },
                    isSelected: isSelectedGender,
                    chipName: genders[index],
                  ),
                );
              }),
            ),
            SizedBox(height: 10,),
             Text('Brand', style: Theme.of(context).textTheme.headlineMedium),

          GridView.builder(
            
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio:2),
          itemCount: brands.length,
           itemBuilder:(context,index){
            return getAllChips(
              onPressed: (){
                
                setState(() {
          
                      brands[index][brands[index].keys.first]= !brands[index].values.first;
          
                  
                });
              },
             isSelected:brands[index].values.first,
             chipName:brands[index].keys.first
            );
           }
           ),
          
              SizedBox(height: 10,),
             Text('Price Range', style: Theme.of(context).textTheme.headlineMedium),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${currentValue.start.round()}',style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize: 14,
                  color:Theme.of(context).brightness == Brightness.dark?AppColors.white: AppColors.black
                ),),
                Text('\$${currentValue.end.round()}',style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize: 14,
                  color:Theme.of(context).brightness == Brightness.dark?AppColors.white: AppColors.black
                ),)
              ],),
             RangeSlider(
              min: 0.0,
              max: 5000.0,
              padding: EdgeInsets.zero,
              
             divisions:100,
             
             values:currentValue, 
             onChanged: (RangeValues value){
             currentValue=value;
             setState(() {
               
             });
             }),
  SizedBox(height: 10,),
             Text('Colors', style: Theme.of(context).textTheme.headlineMedium),
           
          GridView.builder(
            
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio:2),
          itemCount: colorsFilter.length,
           itemBuilder:(context,index){
            return getAllChips(
              onPressed: (){
                
                setState(() {
          
                      colorsFilter[index][colorsFilter[index].keys.first]= !colorsFilter[index].values.first;
          
                  
                });
              },
             isSelected:colorsFilter[index].values.first,
             chipName:colorsFilter[index].keys.first
            );
           }
           ),
           
            SizedBox(height: 20,),
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 60)
              ),

              
               
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>SearchPage()));

              }, child:Text('Apply Filter',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
              ,color: AppColors.white
            ),
            ))
          

          ],
        ),
      ),
    );
  }

  Widget getAllChips({
    required VoidCallback onPressed,
    required bool isSelected,
    required String chipName,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsDirectional.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        backgroundColor: isSelected ? AppColors.primary : AppColors.borderGray,
      ),

      child: Text(
        chipName,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isSelected ? AppColors.white : AppColors.borderGrayDark,
        ),
      ),
    );
  }
}
