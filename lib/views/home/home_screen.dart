import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/utils/themes/styles.dart';
import 'package:calmnest/views/article/article_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../utils/constant/dimensions.dart';
import '../../utils/custom/app_custom_widgets.dart';
import '../../utils/custom/drawer.dart';
import '../../utils/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _quantity = 0;

  @override
  Widget build(BuildContext context) {
        GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    bool isDarkMode = Provider.of<AppThemes>(context, listen: false).isDarkMode;
    return Scaffold(
          key: scaffolKey,
      drawer: const AppDrawer(),
      appBar:  CustomAppBar(
        leading: IconButton(
          onPressed: () => scaffolKey.currentState!.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(),
                ),
                Text(
                  "Good Morning Rashan",
                  style: textStyleDefault(context)
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/face.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/Task.png"),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Talk to Your Friends and find new People Start a Podcast",
                          style: textStyleDefault(context)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            "Start",
                            style: textStyleDefault(context).copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3)),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 230, 217, 114)),
                      child: IconButton(
                        icon: const Icon(Icons.mic),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Use Full Articles",
                    style: textStyleDefault(context),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToRoute(context, const ArticleScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/Articles.png",
                            width: 300,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/article3.png",
                          width: 300,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/Doctor.png",
                            width: 400,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/Doctor3.png",
                          width: 400,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
