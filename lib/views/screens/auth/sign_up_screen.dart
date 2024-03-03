// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element, unused_field

import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/helper/snackbar.dart';
import 'package:calmnest/utils/themes/styles.dart';
import 'package:calmnest/views/screens/auth/sign_in_screen.dart';
import 'package:calmnest/views/screens/auth/verify_otp.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/custom/app_custom_widgets.dart';

// import '../dashboard/dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String _selectedGender = "";
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Register"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomField(
                  icon: Icons.abc_outlined,
                  controller: nameController,
                  hint: "Enter your Name",
                ),
                CustomField(
                  icon: Icons.email,
                  controller: emailController,
                  hint: "Enter Email",
                ),
                CustomField(
                  icon: Icons.call,
                  controller: phoneController,
                  hint: "Enter your Phone Number",
                ),
                CustomPasswordField(
                  icon: Icons.password,
                  controller: passwordController,
                  hint: "Enter Password",
                ),
                CustomPasswordField(
                  icon: Icons.password,
                  controller: cPasswordController,
                  hint: "Confirm Password",
                ),
                GestureDetector(
                  onTap: _openCountryPickerDialog,
                  child: CustomField(
                    isEnabled: false,
                    controller: countryController,
                    hint: _selectedCountry == null
                        ? 'Select you Country'
                        : _selectedCountry!.name,
                    icon: Icons.location_on_outlined,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  title: "SIGN UP",
                  isLoading: authController.isLoading,
                  onTap: () {
                    if (validateInputs()) {
                      authController
                          .signUp(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              passwordController.text,
                              _selectedCountry!.name,
                              _selectedGender)
                          .then((value) {
                        if (value.isSuccess) {
                          print(value.data);
                          navigateToRoute(
                              context,
                              VerifyOTPScreen(
                                id: value.data,
                              ));
                        } else {
                          showCustomSnackbar(value.errorMessage, context);
                        }
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
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
                      "Already have an Account? ",
                      style: textStyleDefault(context),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToRoute(context, const SignInScreen());
                      },
                      child: Text(
                        "Login Here",
                        style: textStyleDefault(context)
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateInputs() {
    bool val = true;
    if (nameController.text.isEmpty) {
      // Show error message for name
      // You can use a SnackBar or showDialog to display the error message
      // Example of using SnackBar:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      val = false;
    }

    if (emailController.text.isEmpty) {
      // Show error message for email
      // Similar to above, you can use SnackBar or showDialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      val = false;
    }

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

    if (_selectedCountry == null) {
      // Show error message for country
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your country')),
      );
      val = false;
    }

    if (_selectedGender == "") {
      // Show error message for gender
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your gender')),
      );
      val = false;
    }

    if (cPasswordController.text.isEmpty) {
      // Show error message for confirmation password
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please confirm your password')),
      );
      val = false;
    }

    if (passwordController.text != cPasswordController.text) {
      // Show error message for password mismatch
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      val = false;
    }
    return val;
    // If all inputs are valid, continue with your logic
    // Here you might proceed with form submission or any other action
  }

  Country? _selectedCountry;
  void _openCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.black,
          searchInputDecoration: const InputDecoration(hintText: 'Search...'),
          isSearchable: true,
          title: const Text('Select your country'),
          onValuePicked: (Country country) {
            setState(() {
              _selectedCountry = country;
            });
            // Navigator.pop(context);
          },
          itemBuilder: (Country country) {
            return Row(
              children: <Widget>[
                CountryPickerUtils.getDefaultFlagImage(country),
                const SizedBox(width: 8.0),
                Expanded(
                    child: Text(
                  "${country.name} (${country.isoCode})",
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            );
          },
        );
      },
    );
  }
}
