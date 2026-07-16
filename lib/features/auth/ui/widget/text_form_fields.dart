import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/constants/app_colors.dart';
import 'package:nova_cart/features/auth/ui/widget/text_styles.dart';

abstract class TextFormFields {
  static TextFormField textFormField({
     final GlobalKey<FormFieldState>? key,
    required final TextEditingController emailController,
    required final FocusNode? focuaNodeDt,
    required final IconData iconData,
    final IconData? suffixIcon,
    required final String hintText,
    
    final TextInputType keyboardTypes=TextInputType.text,
    final TextInputAction textInputActions = TextInputAction.next,

    final bool isObscure = false,
    required final bool themeDt,

    final VoidCallback? onEditingComplete,
    final void Function(String)? onChange,
    final String? Function(String?)? validate,
    final VoidCallback? suffixOnPress,
    final List<TextInputFormatter>? inputFormater,
    final bool? isEnabled
  }) {
    return TextFormField(
      key: key,
      focusNode: focuaNodeDt,
      controller: emailController,
      obscureText: isObscure,
      textInputAction:textInputActions,
      keyboardType:keyboardTypes,
      
      style: TextStyle(
        color: themeDt ? AppColors.white : AppColors.borderGrayDark,
      ),
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormater,
      onTapOutside: (v) { 
        FocusManager.instance.primaryFocus!.unfocus();
      },
      onChanged: onChange,
      validator:validate,
   enabled: isEnabled,
   
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        filled: true,
        errorStyle: TextStyle(
          color: AppColors.signoutRed
        ),
        fillColor: themeDt ? AppColors.offWhiteDark : Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1.5,
            color: themeDt ? AppColors.primaryDark : AppColors.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1.5,
             color: AppColors.signoutRed
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.signoutRed
          ),
        ),
        

        hint: TextStylesAuth.text16RegularGrey(text: hintText, isDark: themeDt),
       suffixIcon: IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
          ),
          onPressed:suffixOnPress,
          icon: FaIcon(
            suffixIcon,
            color: themeDt ? AppColors.borderGray : Color(0xFF6B7280),
            size: 20,
          ),
        ),
        prefixIcon: IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
          ),
          onPressed: () {},
          icon: Icon(
            iconData,
            color: themeDt ? AppColors.borderGray : Color(0xFF6B7280),
            size:iconData==FontAwesomeIcons.user?23: 25,
          ),
        ),
      ),
    );
  }
}
