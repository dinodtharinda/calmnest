// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, must_be_immutable

import 'package:calmnest/controllers/auth_controller.dart';
import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/utils/custom/app_custom_widgets.dart';
import 'package:calmnest/views/screens/Questions/question_screen.dart';
import 'package:calmnest/views/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOTPScreen extends StatefulWidget {
  VerifyOTPScreen({super.key, required this.id});
  String id;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController authController =
        Provider.of<AuthController>(context, listen: true);
    return Scaffold(
      appBar: const CustomAppBar(title: "Verify OTP"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.id.toString()),
              const SizedBox(height: 20.0),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6, // Length of the OTP
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                onChanged: (value) {
                  // Handle changes in the OTP input
                },

                controller: otpController,
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                  isLoading: authController.isLoading,
                  title: "Verify OPT",
                  onTap: () {
                    authController
                        .verifiyOTP(widget.id, otpController.text)
                        .then((value) {
                      if (value.isSuccess) {
                        navigateToRoute(context, SignInScreen());
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
