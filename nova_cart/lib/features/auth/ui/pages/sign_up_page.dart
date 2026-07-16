import 'package:flutter/material.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _userNameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();

  bool isPasswordClk = false;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    userNameFocusNode.dispose();
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
                  text: 'Create Account',
                  isDark: themeDt,
                ),
                TextStylesAuth.text16RegularGrey(
                  text: 'Start your journey with us today',
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
                          text: '   User Name',
                          isDark: themeDt,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormFields.textFormField(
                        key: _userNameKey,
                        emailController: userNameController,
                        focuaNodeDt: userNameFocusNode,
                        iconData: FontAwesomeIcons.user,
                        hintText: 'Enter your FullName',
                        themeDt: themeDt,
                        validate: FormValidatorAuth.userName,
                        onChange: (userName) {
                          FormValidatorAuth.emailValidation(userName);
                          _userNameKey.currentState!.validate();
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(emailFocusNode);
                        },
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextStylesAuth.text14SemiBoldBlack(
                          text: '   Email',
                          isDark: themeDt,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormFields.textFormField(
                        key: _emailKey,
                        emailController: emailController,
                        focuaNodeDt: emailFocusNode,
                        iconData: Icons.email_outlined,
                        hintText: 'Enter your email',
                        themeDt: themeDt,
                        validate: FormValidatorAuth.emailValidation,
                        onEditingComplete: () {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                        onChange: (email) {
                          FormValidatorAuth.passwordValidation(email);
                          _emailKey.currentState!.validate();
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
                        key: _passwordKey,
                        emailController: passwordController,
                        focuaNodeDt: passwordFocusNode,
                        iconData: Icons.lock_outline_rounded,
                        isObscure: isPasswordClk ? false : true,
                        hintText: 'Enter your password',
                        themeDt: themeDt,
                        validate: FormValidatorAuth.passwordValidation,
                        suffixOnPress: () {
                          isPasswordClk = !isPasswordClk;
                          setState(() {});
                        },
                        onChange: (password) {
                          FormValidatorAuth.passwordValidation(password);
                          _passwordKey.currentState!.validate();
                        },
                        textInputActions: TextInputAction.go,
                        suffixIcon: isPasswordClk
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        onEditingComplete: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                      ),

                      SizedBox(height: 16),

                      SizedBox(
                        height: 56,
                        width: mediaQuery.width,
                        child: AuthButtons.authButton(
                          btnName: 'SignUp',
                          isDark: themeDt,
                          onPressed: () {
                            final String email = emailController.text;
                            final String password = passwordController.text;
                            final String userName = userNameController.text;

                            if (_formKey.currentState!.validate()) {
                              final AuthCredincialModel signUp =
                                  AuthCredincialModel(
                                    userName:userName,
                                    emailAddress: email,
                                    password: password,
                                  );
                              context.read<AuthBloc>().add(
                                RegisterRequested(signUp),
                              );

                            print(userName);

                            }
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
                            text: "Already have an account?  ",
                            isDark: themeDt,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                AuthPageChange(AuthPageChangeIndex.loginPage),
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
