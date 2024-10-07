import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/main_view_controller.dart';
import '../utils/constants.dart';
import 'ShopePage.dart';
import 'home_screen.dart';
import 'order_screen.dart';

class MainViewScreen extends StatelessWidget {
  MainViewController mainViewController = Get.put(MainViewController());

  List<Widget> pages = [
      ShopeScreen(),
    HomeScreen(),
    const Text("tracking"),

    const Text("orders"),
    OrderScreen(),
    const Text("wallet"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Obx((){
        return Center(child: pages[mainViewController.selectedIndex.value]);
        })
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => mainViewController.changeIndex(index),
        backgroundColor: Colors.transparent,
        color: primaryColor,
        height: 55,
        items: [
          bottomIcon(homeIcon),
          bottomIcon(trackingIcon),
          bottomIcon(orderIcon),
          //todo : replace with walletIcon
          bottomIcon(shopIcon),
          bottomIcon(settingsIcon),
        ],
      )
      ,
    );
  }
  Widget bottomIcon(String path){
    return Image.asset(
      path,
      height: 25,
      color: Colors.white,
    );
  }
}
