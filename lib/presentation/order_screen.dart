
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/components.dart';
import '../utils/constants.dart';

class Status {
  String name;
  Color color;

  Status({required this.name, required this.color});
}

class OrderScreen extends StatelessWidget {


  List<Status> status = [
    Status(name: 'Delivered', color: greenColor),
    Status(name: 'On way', color: Colors.blueAccent),
    Status(name: 'In preparation', color: Colors.amber),
    Status(name: 'Canceled', color: Colors.red),
    Status(name: 'Suspended', color: Colors.deepOrangeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mediumVerticalSpace,
              if (Navigator.canPop(context)) ...[
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back),
                ),
                mediumVerticalSpace,
              ],

              const Text(
                'Orders',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              mediumVerticalSpace,
              SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: status.length + 1,
                  separatorBuilder: (cx, index) => mediumHorizontalSpace,
                  itemBuilder: (cx, index) {
                    return index == 0
                        ? filledButton(
                            child: const Text(
                              'All',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                            },
                          )
                        : outlinedButton(
                            child: Text(
                              status[index - 1].name,
                              style: const TextStyle(color: blackColor),
                            ),
                            onPressed: () {},
                          );
                  },
                ),
              ),
              mediumVerticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(3),
                  itemCount: 10,
                  separatorBuilder: (_, __) => mediumVerticalSpace,
                  itemBuilder: (cx, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(.2),
                            offset: const Offset(1, 1),
                            blurRadius: 5,
                          ),
                          /*BoxShadow(
                            color: blackColor.withOpacity(.2),
                            offset: const Offset(-1, -1),
                            blurRadius: 5,
                          ),*/
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(packageImage, height: 50),
                                  mediumHorizontalSpace,
                                  Column(
                                    children: const [
                                      Text(
                                        'Abdou Shop',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      smallVerticalSpace,
                                      Text(
                                        'Abderrazak',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: status[index % 5].color,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  status[index % 5].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          mediumVerticalSpace,
                          Row(
                            children: const [
                              Text('Order ID: '),
                              Text(
                                '#123456',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          smallVerticalSpace,
                          Row(
                            children: const [
                              Text('Order Placed: '),
                              Text(
                                '02/03/2023',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          mediumVerticalSpace,
                          SizedBox(
                            width: double.infinity,
                            child: filledButton(
                              child: const Text(
                                "Track Package",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
