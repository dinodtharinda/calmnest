import 'package:calmnest/utils/custom/app_custom_widgets.dart';
import 'package:calmnest/utils/themes/styles.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset("assets/images/articleMain.png"),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              '''
          In today's fast-paced world, stress has become a common companion in our lives. However, managing stress iscrucial for our mental and physical well-being. This article provides practical tips and techniques to help you reduce and relieve stress, allowing you to live a happier and healthier life.
          In today's fast-paced world, stress has become a common companion in our lives. However, managing stress iscrucial for our mental and physical well-being. This article provides practical tips and techniques to help you reduce and relieve stress, allowing you to live a happier and healthier life.
          In today's fast-paced world, stress has become a common companion in our lives. However, managing stress iscrucial for our mental and physical well-being. This article provides practical tips and techniques to help you reduce and relieve stress, allowing you to live a happier and healthier life.
          In today's fast-paced world, stress has become a common companion in our lives. However, managing stress iscrucial for our mental and physical well-being. This article provides practical tips and techniques to help you reduce and relieve stress, allowing you to live a happier and healthier life.''',
              style: textStyleDefault(context),
              textAlign: TextAlign.justify,
            ),
          )
        ]),
      ),
    );
  }
}
