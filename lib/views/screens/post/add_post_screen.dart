import 'dart:io';

import 'package:calmnest/controllers/auth_controller.dart';
import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/utils/custom/app_custom_widgets.dart';
import 'package:calmnest/views/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController messageController = TextEditingController();
  XFile? _image;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Post Here"),
      body: Column(
        children: [
          CustomField(controller: messageController),
          GestureDetector(
            onTap: _getImage,
            child: Container(
              color: Colors.grey[200],
              height: 200,
              width: double.infinity,
              child: _image == null
                  ? Icon(Icons.add_a_photo, size: 50)
                  : Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          CustomButton(
              title: "Share Post",
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                final id = sp.getString("id");
                if (id != null) {
                  await Provider.of<AuthController>(context, listen: false)
                      .postShare(id, messageController.text, File(_image!.path))
                      .then((value) {
                    if (value.isSuccess) {
                     navigateToRouteReplace(context, DashboardScreen());
                    }
                  });
                }
              })
        ],
      ),
    );
  }
}
