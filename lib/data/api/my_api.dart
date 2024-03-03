import 'dart:convert';
import 'dart:io';

import 'package:calmnest/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/response/response_model.dart';



class YourHttpService with ChangeNotifier {  
  Future<ResponseModel> postShare(String id, String msg, File image) async {
    ResponseModel responseModel = ResponseModel(isSuccess: false, data: []);
    try {
      var request = http.MultipartRequest('POST', Uri.parse("${AppConstants.BASE_URL}${AppConstants.CREATE_POST}"));
      request.fields['message'] = msg;
      request.fields['user_id'] = id;

      // Attach the image as a file
      var pic = await http.MultipartFile.fromPath('image', image.path);
      request.files.add(pic);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200||response.statusCode == 201) {
        var responseData = json.decode(response.body);
        responseModel = ResponseModel(isSuccess: true, data: responseData);
      } else {
        responseModel = ResponseModel(isSuccess: false, data: 'Failed to upload image');
      }
    } catch (error) {
    print(error);
    }

    return responseModel;
  }
}
