import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/constants.dart';
import 'package:shop/utils/constants.dart';

import '../controller/commance_controller.dart';
import '../controller/shop_controller.dart';
import '../data/models/commande.dart';
import '../utils/components.dart';
import 'dart:math' as math;

import '../utils/constants.dart';

class ShopeScreen extends StatelessWidget {
ShopController shopController = Get.put(ShopController());
TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
  void showWilayaDialog(BuildContext context, ShopController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15), // Add padding
              width: double.infinity, // Use the full width of the dialog
              decoration: BoxDecoration(
                color: Colors.purple, // Background color
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),  // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Add shadow
                    blurRadius: 5,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Center( // Center the title text
                child: Text(
                  "اختر ولاية",
                  style: TextStyle(
                    fontSize: 22, // Increase font size
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: Colors.white, // White text color
                    fontFamily: fontFamily, // Ensure the correct font family is used
                  ),
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView(
              children: controller.wilayas.map((String wilaya) {
                return InkWell(
                  onTap: (){
                    controller.selectWilaya(wilaya);
                    controller.loadCommunesForSelectedWilaya(); // Load communes when a wilaya is selected
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Radio<String>(
                        value: wilaya,
                        groupValue: controller.selectedWilaya, // This will be the selected wilaya
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.selectWilaya(value);
                            controller.loadCommunesForSelectedWilaya(); // Load communes when a wilaya is selected
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      Text(
                        wilaya,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.size.width,
                color: Colors.purple,
                child: const Center(
                    child: const Text(
                  "DT.Shop",
                  style: TextStyle(
                      fontFamily: fontFamily,
                      color: Colors.white,
                      fontSize: 30),
                )),
              ),
              bigVerticalSpace,
              Container(
                width: Get.size.width,
                // color: Colors.white60,
                child: const Center(
                    child: const Text(
                  "we are onligne boutique . shop select your product from your home and get it with best price ",
                  style: TextStyle(
                      fontFamily: fontFamily,
                      color: Colors.black,
                      fontSize: 20),
                )),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(.2),
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: blackColor.withOpacity(.2),
                      offset: const Offset(-3, -3),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              bigVerticalSpace,
              Text(
                "2800 ",
                style: TextStyle(
                    fontFamily: fontFamily, color: Colors.black, fontSize: 30),
              ),
              Center(
                child: Card(
                  child: Image.asset("$packageImage"),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Card(
                      child: Image.asset(
                        "$packageImage",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
              bigVerticalSpace,
              SingleChildScrollView(
                child: Container(
                  width: Get.width,
                  // height:600,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        " put your inforamtion ",
                        style: TextStyle(fontSize: 27),
                      ),
                      smallVerticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: "Tab your name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // You can change the color here
                                width: 1.0, // Customize the thickness
                              ),
                            ),
                          ),
                        ),
                      ),
                      smallVerticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Tab your phone number ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // You can change the color here
                                width: 1.0, // Customize the thickness
                              ),
                            ),
                          ),
                        ),
                      ),
                      smallVerticalSpace,


                      GetBuilder<ShopController>(
                        builder:(controler){
                          return  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2.0,
                                  color: Colors.black45,
                                ),
                              ),
                              child: InkWell(
                                onTap: () => showWilayaDialog(context, shopController),
                                child: settingsItem(
                                  label: shopController.selectedWilaya,
                                  dropWidget: Transform.rotate(
                                    angle: math.pi / 2,
                                    child: const Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                      ),

                      smallVerticalSpace,
                      ////////// *****************************comune
                      // قائمة اختيار البلديات
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2.0,
                              color: Colors.black45,
                            ),
                          ),
                          child: GetBuilder<ShopController>(
                              builder: (controller) {
                                return PopupMenuButton<String>(
                                  position: PopupMenuPosition.under,
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: settingsItem(
                                    label: controller.selectedCommune.isNotEmpty
                                        ? controller.selectedCommune // إظهار البلدية المختارة
                                        : "اختر بلدية", // نص افتراضي
                                    dropWidget: Transform.rotate(
                                      angle: math.pi / 2,
                                      child: const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  itemBuilder: (BuildContext cx) {
                                    return controller.communes.map((String commune) {
                                      return PopupMenuItem<String>(
                                        value: commune,
                                        child: Row(
                                          children: [
                                            smallHorizontalSpace,
                                            Text(commune),
                                          ],
                                        ),
                                      );
                                    }).toList();
                                  },

                                  onSelected: (String selectedCommune) {
                                    controller.selectCommune(selectedCommune);

                                  },
                                );
                              }
                          ),
                        ),
                      ),



                    /**********************************///////////comune


                      bigVerticalSpace,

                      Container(
                        height: 50,
                        width: Get.size.width - 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.redAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Shadow color
                              offset: Offset(2, 4), // Shadow position
                              blurRadius: 5, // Shadow blur
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            Command command = Command(
                              clientName: name.toString(),
                              wilaya:  shopController.selectedWilaya,
                              commune: shopController.selectedCommune,
                              quantity: 2,
                              product: "1",
                            );
                            CommandController controller = CommandController();
                            await controller.saveCommand(command);



                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Transparent background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                            ),
                            elevation: 0, // Remove default shadow
                            padding: EdgeInsets.symmetric(vertical: 12), // Internal padding
                          ),
                          child: Text(
                            'شراء',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),


                      bigVerticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
