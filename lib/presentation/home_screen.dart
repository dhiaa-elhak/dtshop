
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/presentation/store_screen.dart';

import '../utils/components.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => StoreScreen()),
              child: Row(
                children: [
                  Image.asset(shopIcon, height: 25),
                  smallHorizontalSpace,
                  const Text(
                    "Boutique",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "AO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bigVerticalSpace,
            MyTextField(
              controller: searchController,
              hintText: "Tracking Number, Order ID, etc...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("|"),
                  Image.asset(qrCodeIcon, height: 20),
                ],
              ),
            ),
            bigVerticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(bannerImage, fit: BoxFit.cover ),
              ),
            ),
            bigVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                menuWidget(
                  label: "Send Package",
                  icon: orderIcon,
                  onTap: () {},
                ),
                menuWidget(
                  label: "Calculate Sipping Rate",
                  icon: calculatorIcon,
                  onTap: () {},
                ),
                menuWidget(
                  label: "Get Position",
                  icon: addressIcon,
                  onTap: () {},
                ),
                menuWidget(
                  label: "Customer Support",
                  icon: contactIcon,
                  onTap: () {},
                ),
              ],
            ),
            bigVerticalSpace,
            const Text(
              "Recently shipped",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            smallVerticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int j = 0; j < 3; j++)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      width: Get.size.width * 0.85,
                      constraints:
                          BoxConstraints(maxWidth: Get.size.width * 0.85),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(.2),
                            offset: const Offset(3, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Order ID',
                                    style: TextStyle(color: greyColor),
                                  ),
                                  smallVerticalSpace,
                                  Text(
                                    "#012564",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  "In Transit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          mediumVerticalSpace,
                          Builder(
                            builder: (cx) {
                              double width =
                                  Get.size.width * 0.22;
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          '02/01/2023',
                                          style: TextStyle(color: greyColor),
                                        ),
                                        smallVerticalSpace,
                                        Text(
                                          "Alger plage",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: primaryColor),
                                    ),
                                    child: const Text('Electronics'),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          '02/03/2023',
                                          style: TextStyle(color: greyColor),
                                        ),
                                        smallVerticalSpace,
                                        Text(
                                          "Adrar",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          mediumVerticalSpace,
                          Builder(
                            builder: (cx) {
                              double width =
                                  (Get.size.width * 0.85 - 20) / 4;
                              int index = 2;
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Container(
                                            color: i < index
                                                ? primaryColor
                                                : greyColor,
                                            height: 3,
                                            width: width,
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: i <= index
                                                ? primaryColor
                                                : greyColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: i == index
                                              ? const Center(
                                                  child: Icon(
                                                    Icons.fire_truck,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : null,
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          mediumVerticalSpace,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.send,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuWidget({
    required String label,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 35 + 24 + 5 ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(.2),
                    offset: const Offset(1, 1),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: blackColor.withOpacity(.2),
                    offset: const Offset(-1, -1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: assetIcon(icon: icon, color: primaryColor),
            ),
            smallVerticalSpace,
            Text(
              label,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
