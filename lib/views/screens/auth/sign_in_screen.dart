// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers
import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/helper/snackbar.dart';
import 'package:calmnest/utils/themes/styles.dart';
import 'package:calmnest/views/screens/Questions/question_screen.dart';
import 'package:calmnest/views/screens/auth/sign_up_screen.dart';
import 'package:calmnest/views/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/custom/app_custom_widgets.dart';

// import '../dashboard/dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // phoneController.text = "0789814863";
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Login"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                icon: Icons.call,
                controller: phoneController,
                hint: "Mobile Number",
              ),
              CustomPasswordField(
                icon: Icons.password,
                controller: passwordController,
                hint: "Password",
              ),
              CustomButton(
                title: "SIGN IN",
                isLoading: authController.isLoading,
                onTap: () {
                  if (validateInputs()) {
                    authController
                        .login(phoneController.text, passwordController.text)
                        .then((value) {
                      if (value.isSuccess) {
                        navigateToRouteReplace(context,  QuestionTabScreen());
                      } else {
                        showCustomSnackbar(value.errorMessage, context);
                      }
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Or continue with",
                style: textStyleDefault(context),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: textStyleDefault(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateToRoute(context, const SignUpScreen());
                    },
                    child: Text(
                      "Create an account",
                      style: textStyleDefault(context)
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateInputs() {
    bool val = true;
    if (phoneController.text.isEmpty) {
      // Show error message for phone
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your phone number')),
      );
      val = false;
    }

    if (passwordController.text.isEmpty) {
      // Show error message for password
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password')),
      );
      val = false;
    }

    return val;
  }
}
