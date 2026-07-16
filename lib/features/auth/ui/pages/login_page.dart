import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nova_cart/core/common/enum.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_bloc.dart';
import 'package:nova_cart/features/auth/ui/bloc/auth_event.dart';
import 'package:nova_cart/features/auth/data/model/auth_credincial_model.dart';
import 'package:nova_cart/core/utilities/validation.dart';
import 'package:nova_cart/features/auth/ui/widget/auth_buttons.dart';
import 'package:nova_cart/features/auth/ui/widget/text_form_fields.dart';
import 'package:nova_cart/features/auth/ui/widget/text_styles.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isPasswordClk = false;
  bool isEnabled = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

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
                  text: 'Welcome back!',
                  isDark: themeDt,
                ),
                TextStylesAuth.text16RegularGrey(
                  text: 'Please enter your details to sign in',
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
                        key: emailKey,
                        emailController: emailController,
                        focuaNodeDt: emailFocusNode,
                        iconData: Icons.email_outlined,
                        hintText: 'Enter your email',
                        themeDt: themeDt,

                        validate: FormValidatorAuth.emailValidation,

                        onChange: (email) {
                          FormValidatorAuth.emailValidation(email);
                          emailKey.currentState!.validate();
                        },
                        keyboardTypes: TextInputType.emailAddress,
                        inputFormater: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9@._-]'),
                          ),
                        ],
                        onEditingComplete: () {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                      ),
                      SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextStylesAuth.text14SemiBoldBlack(
                          text: '   Password',
                          isDark: themeDt,
                        ),
                      ),
                      SizedBox(height: 5),

                      TextFormFields.textFormField(
                        key: passwordKey,

                        emailController: passwordController,
                        focuaNodeDt: passwordFocusNode,
                        iconData: Icons.lock_outline_rounded,
                        isObscure: isPasswordClk ? false : true,
                        hintText: 'Enter your password',
                        themeDt: themeDt,
                        onChange: (email) {
                          FormValidatorAuth.emailValidation(email);
                          passwordKey.currentState!.validate();
                        },

                        suffixOnPress: () {
                          isPasswordClk = !isPasswordClk;
                          setState(() {});
                        },
                        textInputActions: TextInputAction.go,
                        suffixIcon: isPasswordClk
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,

                        validate: FormValidatorAuth.passwordValidation,
                        inputFormater: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9!@#\$%^&*()_+=\-]'),
                          ),
                          LengthLimitingTextInputFormatter(32),
                        ],

                        onEditingComplete: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                      ),

                      SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: const Color.fromRGBO(0, 0, 0, 0),
                          onTap: () {
                            print("AuthGetIs Clecked!!!");
                            context.read<AuthBloc>().add(
                              AuthPageChange(AuthPageChangeIndex.forgetPage),
                            );
                          },
                          child: TextStylesAuth.text14SemiBoldPrimary(
                            text: '   Forget your password?',
                            isDark: themeDt,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      SizedBox(
                        height: 56,
                        width: mediaQuery.width,
                        child: AuthButtons.authButton(
                          btnName: 'Login',
                          isDark: themeDt,
                          onPressed: () {
                            final String email = emailController.text;
                            final String password = passwordController.text;
                            if (_formKey.currentState!.validate()) {
                              AuthCredincialModel logIn = AuthCredincialModel(
                                emailAddress: email,
                                password: password,
                              );
                              context.read<AuthBloc>().add(
                                LoginInRequested(logIn),
                              );
                            }
                            setState(() {
                              isEnabled = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: TextStylesAuth.text12RegularGrey(
                          text: 'or Login with',
                          isDark: themeDt,
                        ),
                      ),
                      SizedBox(height: 16),

                      AuthButtons.authButtonsOtherLogin(
                        btnName: 'Continue with Google',
                        iconData: FontAwesomeIcons.google,
                        isDark: themeDt,
                        onPressed: () {
                          context.read<AuthBloc>().add(GoogleSignInUp());
                        },
                      ),

                      SizedBox(height: 16),
                      AuthButtons.authButtonsOtherLogin(
                        btnName: 'Continue with Facebook',
                        iconData: FontAwesomeIcons.facebook,
                        isDark: themeDt,
                        onPressed: () {},
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextStylesAuth.text14RegularNormal(
                            text: "Don't have an account? ",
                            isDark: themeDt,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            onPressed: () {

                              context.read<AuthBloc>().add(
                                AuthPageChange(AuthPageChangeIndex.sighUpPage),
                              );

                            },
                            child: TextStylesAuth.text14SemiBoldPrimary(
                              text: 'Sign up',
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
