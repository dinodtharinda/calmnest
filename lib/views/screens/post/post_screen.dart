import 'dart:convert';
import 'dart:typed_data';

import 'package:calmnest/controllers/auth_controller.dart';
import 'package:calmnest/data/model/models/post.dart';
import 'package:calmnest/data/repository/auth_repo.dart';
import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/utils/custom/app_custom_widgets.dart';
import 'package:calmnest/views/screens/post/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool isLoading = false;

  Future<void> refresh() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<AuthController>(context, listen: false).getAllPost();
    setState(() {
      isLoading = false;
    });
  }

  List<Post> post = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    post = Provider.of<AuthController>(context).post;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Feeds",
        actions: [IconButton(onPressed: () {
          navigateToRoute(context, AddPostScreen());
        }, icon: const Icon(Icons.add))],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return PostWidget(
                    base64String: post[index].image,
                    uid: post[index].userId,
                    msg: post[index].message);
              },
              itemCount: post.length,
            ),
    );
  }
}

// {
//     "comments": [],
//     "id": "65e36d6e05fc717b3d25474b",
//     "image": "iVBORw0K=",
//     "likes": [],
//     "message": "msg",
//     "user_id": "65e348e405fc717b3d254747"
// }

class PostWidget extends StatefulWidget {
  final String base64String;
  final String uid;
  final String msg;

  const PostWidget({
    super.key,
    required this.base64String,
    required this.uid,
    required this.msg,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String name = "Malinda";

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final user = await Provider.of<AuthController>(context, listen: false)
        .getUserById(widget.uid);
    name = user.data["name"];
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(widget.base64String);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(width: 0.5)),
      child: Column(
        children: [
          Row(
            //headers
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.msg)
                ],
              )
            ],
          ),
          Image.memory(
            bytes,
          ),
          // Image.network(
          //     "https://th.bing.com/th/id/OIP.LFu1PuhykoIrbG_CuqkqlQHaE7?rs=1&pid=ImgDetMain")
        ],
      ),
    );
  }
}
