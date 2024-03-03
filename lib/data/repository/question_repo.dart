import 'package:calmnest/data/api/api_client.dart';
import 'package:flutter/material.dart';

import '../../utils/constant/app_constants.dart';
import '../model/response/response_model.dart';

class QuestionRepo with ChangeNotifier{
 final HttpService httpService;

  QuestionRepo({required this.httpService});

  Future<ResponseModel> sendAnswers(Map<String,String> answers)async{
     ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      
      final response = await httpService.postData(
        uri: AppConstants.QUESTIONER_URI,
        body:answers,
      );
      responseModel = response;
      if (response.isSuccess) {
        // final String? token = response.data['token'] as String?;
        // if (token != null) {
        //   _saveToken(token);
        // }
      }
    } catch (error) {
      _handleError('Login failed repo', error);
    }
    return responseModel;
  }

  
  void _handleError(String message, dynamic error) {
    debugPrint('$message: $error');
    // Handle errors as needed, e.g., show a snackbar or log to analytics
  }
}