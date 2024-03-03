// ignore_for_file: avoid_print

import 'package:calmnest/views/screens/doctor/doctor_screen.dart';
import 'package:calmnest/views/screens/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/constant/dimensions.dart';
import '../../../utils/custom/app_custom_widgets.dart';
import '../../../utils/custom/drawer.dart';
import '../../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;
  _setPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Future<void> refresh() async {
    print("start");

    await Future.delayed(const Duration(seconds: 3));
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: const [
          PostScreen(),
          DoctorsScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(Dime.PADDING_SIZE_EXTRA_SMALL),
          child: Row(children: [
            BottomNavItem(
                iconData: Icons.rss_feed_sharp,
                isSelected: pageIndex == 0,
                onTap: ()  { 
                  print("Index 1");
                  _setPage(0);
                }),
            BottomNavItem(
                iconData: Icons.people,
                isSelected: pageIndex == 1,
                onTap: () {
                  print("Index 1");
                  _setPage(1);
                }),
            BottomNavItem(
                iconData: Icons.home,
                isSelected: pageIndex == 2,
                onTap: () {
                  print("Index 1");
                  _setPage(2);
                }),
            BottomNavItem(
                iconData: Icons.man,
                isSelected: pageIndex == 3,
                onTap: () {
                  print("Index 1");
                  _setPage(3);
                }),
            BottomNavItem(
                iconData: Icons.message,
                isSelected: pageIndex == 4,
                onTap: () {
                  print("Index 1");
                  _setPage(4);
                }),
          ]),
        ),
      ),
    );
  }
}
