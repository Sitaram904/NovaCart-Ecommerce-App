import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/core/di/injection_container.dart';
import 'package:nova_cart/features/auth_gate.dart';
import 'package:nova_cart/features/onboarding/model/onboarding_models.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _onboardingController = PageController();
  // ignore: prefer_final_fields

 PageController get pageCon{
  return _onboardingController;
 }
  int _selectPageIndex = 0;
  
  List<Widget> screens = [
    Center(
      child: OnBoardingContent(
        imageUrl:OnBoardingContents.contents[0].imageUrl,
        onTitle:OnBoardingContents.contents[0].screenTitle ,
        onContent:OnBoardingContents.contents[0].screenDetail
      ),
    ),
    Center(
      child: OnBoardingContent(
        imageUrl:OnBoardingContents.contents[1].imageUrl,
        onTitle:OnBoardingContents.contents[1].screenTitle, 
        onContent:OnBoardingContents.contents[1].screenDetail

      ),
    ),
    Center(
      child: OnBoardingContent(
        imageUrl:OnBoardingContents.contents[2].imageUrl,
        onTitle:OnBoardingContents.contents[2].screenTitle,
        onContent:OnBoardingContents.contents[2].screenDetail

      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        onPageChanged: (int pageindex) => setState(() {
          _selectPageIndex = pageindex;
        }),
        controller: _onboardingController,
        children: List.generate(screens.length, (index) {
          return Padding(

            padding: const EdgeInsets.only(top:30),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
              screens.length-1==_selectPageIndex?SizedBox(height: 50,):   Align(
                alignment: Alignment.centerRight,
                child:  TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    overlayColor:Colors.transparent
                  ),
                  onPressed:(){
                    pageCon.animateToPage(screens.length-1,
                     duration: Duration(milliseconds: 200), curve: Curves.linear);
                }, child:Text('Skip',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.searchTextGrey
                  ),
                
                )),
              ),
                screens[index],
              ],
            ),
          );
        }),
      ),

      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: 80,
        alignment: Alignment.topCenter,
        width: double.infinity,
        color: Colors.transparent,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),

          child: _selectPageIndex == screens.length - 1
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    changeAttach();
                    Navigator.push(context,MaterialPageRoute(builder: 
                    (_)=>AuthGate()));
                    
                  },
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 10,
                      children: List.generate(screens.length, (index) {
                        return AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                          height: 10,
                          width: _selectPageIndex == index ? 50 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _selectPageIndex == index
                                ? AppColors.primary
                                : AppColors.botomIconGrey,
                          ),
                        );
                      }),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(50),
                        ),
                        minimumSize: Size(100, 50),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        _onboardingController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.arrowRightLong,
                        size: 24,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String imageUrl;
  final String onTitle;
  final String onContent;
  const OnBoardingContent({
    super.key,
    required this.imageUrl,
    required this.onTitle,
    required this.onContent,
  });
  @override
  Widget build(BuildContext context) {
    final adc = Theme.of(context).colorScheme.brightness ==Brightness.dark;
    return Align(
      alignment: AlignmentGeometry.topEnd,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                 
                 imageUrl,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                onTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
              letterSpacing: 3,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                  color: adc?AppColors.white: AppColors.black,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                textAlign: TextAlign.center,
                onContent,
          
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color:adc?AppColors.borderGray: AppColors.borderGrayDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
