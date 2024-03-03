// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/model/models/post.dart';
import '../data/model/response/response_model.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> login(String phone, String password) async {
    _setLoading(true);
    notifyListeners();

    // final errorMessage = validateLoginInputs(phone, password);
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    // if (errorMessage != null) {
    //   // Handle validation error
    //   print('Validation Error: $errorMessage');
    //   return responseModel;
    // }
    try {
      _setLoading(true);
      final respose = await authRepository.login(phone, password);
      responseModel = respose;
      // Perform additional actions after a successful login if needed
    } catch (error) {
      // Handle login error, e.g., show an error message
      debugPrint('Login failed contr: $error');
    } finally {
      _setLoading(false);
      notifyListeners();
    }
    return responseModel;
  }

  Future<ResponseModel> signUp(String name, String email, String mobile,
      String password, String country, String gender) async {
    // Create a response model with default values
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);

    try {
      // Set loading to true, if you want to show a loading indicator during signup
      _setLoading(true);
      notifyListeners();

      // Call your repository or API method to perform signup
      final response = await authRepository.signUp(
          name, email, mobile, password, country, gender);

      // Update the response model with the received response
      responseModel = response;

      // Perform additional actions after a successful signup if needed
    } catch (error) {
      // Handle signup error, e.g., show an error message
      debugPrint('Signup failed: $error');
    } finally {
      // Set loading to false after signup attempt is done
      _setLoading(false);
      notifyListeners();
    }

    // Return the response model
    return responseModel;
  }

  Future<ResponseModel> verifiyOTP(String id, String otp) async {
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      // Set loading to true, if you want to show a loading indicator during signup
      _setLoading(true);
      notifyListeners();

      // Call your repository or API method to perform signup
      final response = await authRepository.verifyOTP(id, otp);

      // Update the response model with the received response
      responseModel = response;

      // Perform additional actions after a successful signup if needed
    } catch (error) {
      // Handle signup error, e.g., show an error message
      debugPrint('Signup failed: $error');
    } finally {
      // Set loading to false after signup attempt is done
      _setLoading(false);
      notifyListeners();
    }

    // Return the response model
    return responseModel;
  }

    Future<ResponseModel> postShare(String id, String msg,File image) async {
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      // Set loading to true, if you want to show a loading indicator during signup
      _setLoading(true);
      notifyListeners();

      // Call your repository or API method to perform signup
      final response = await authRepository.postShare(id, msg, image);

      // Update the response model with the received response
      responseModel = response;

      // Perform additional actions after a successful signup if needed
    } catch (error) {
      // Handle signup error, e.g., show an error message
      debugPrint('post failed: $error');
    } finally {
      // Set loading to false after signup attempt is done
      _setLoading(false);
      notifyListeners();
    }

    // Return the response model
    return responseModel;
  }


  List<Post> _posts = [];
  List<Post> get post => _posts.reversed.toList();

  Future<ResponseModel> getAllPost() async {
    _setLoading(true);

    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    // try {
      final response = await authRepository.getPost();

      _posts = Post.parsePosts(response.data);
      _setLoading(false); 

      responseModel = response;
      return response;
    // } catch (error) {
    //   debugPrint('Post failed: $error');
    // } finally {
    //   _setLoading(false);
    // }

    // return responseModel;
  }

  Future<ResponseModel> getUserById(String uid) async {
    _setLoading(true);

    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      // notifyListeners();
      print("pass 1 controller");
      final response =
          await authRepository.getUserById(uid);

      responseModel = response;
    } catch (error) {
      debugPrint('User failed : $error');
    } finally {
      _setLoading(false);
      notifyListeners();
    }

    return responseModel;
  }

  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      // notifyListeners();
    }
  }
}
