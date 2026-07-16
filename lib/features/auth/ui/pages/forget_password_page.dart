import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_cart/core/common/enum.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_bloc.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_event.dart';
import 'package:nova_cart/features/auth/data/firebase_auth_connector.dart';
import 'package:nova_cart/core/utilities/validation.dart';
import 'package:nova_cart/features/auth/ui/widget/auth_buttons.dart';
import 'package:nova_cart/features/auth/ui/widget/text_form_fields.dart';
import 'package:nova_cart/features/auth/ui/widget/text_styles.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeDt = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: mediaQuery.height * 0.1),
                TextStylesAuth.text32Bold(
                  text: 'Forgot Password',
                  isDark: themeDt,
                ),
                TextStylesAuth.text16RegularGrey(
                  text:
                      'Don’t worry! It happens. Please enter the email associated with your account.',
                  isDark: themeDt,
                ),
                SizedBox(height: 50),

                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextStylesAuth.text14SemiBoldBlack(
                          text: '   Email',
                          isDark: themeDt,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormFields.textFormField(
                        textInputActions: TextInputAction.done,
                        emailController: emailController,
                        focuaNodeDt: emailFocusNode,
                        iconData: Icons.email_outlined,
                        hintText: 'Enter your email',
                        themeDt: themeDt,
                        validate: FormValidatorAuth.emailValidation,
                        onChange: (email) {
                          FormValidatorAuth.emailValidation(email);
                          _formKey.currentState!.validate();
                        },
                        onEditingComplete: () {
                          _formKey.currentState!.validate();
                        },
                      ),

                      SizedBox(height: 16),

                      SizedBox(
                        height: 56,
                        width: mediaQuery.width,
                        child: AuthButtons.authButton(
                          btnName: 'Send email',
                          isDark: themeDt,
                          onPressed: () async {
                            final email = emailController.text;
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuthConnector.forgetPassword(
                                email: email,
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStylesAuth.text14RegularNormal(
                            text: "Remember password? ",
                            isDark: themeDt,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                AuthPageChange(AuthPageChangeIndex.loginPage) as AuthEvents,
                              );
                            },
                            child: TextStylesAuth.text14SemiBoldPrimary(
                              text: 'Login',
                              isDark: themeDt,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
