import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import '../utils/components.dart';
import '../utils/constants.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  List<WilayaChartData> data = [
    WilayaChartData("Alger", 40, 50, 10),
    WilayaChartData("Chlef", 15, 60, 15),
    WilayaChartData("Annaba", 30, 80, 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumVerticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.menu, size: 35),
                    mediumHorizontalSpace,
                    Expanded(
                      child: MyTextField(
                        controller: searchController,
                        hintText: "Tracking Number, Order IDfffffffffff, etc...",
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
                    ),
                  ],
                ),
                bigVerticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CardView(
                        color: Colors.redAccent,
                        title: "Shipped",
                        value: "85",
                        icon: shippedIcon,
                      ),
                    ),
                    mediumHorizontalSpace,
                    Expanded(
                      child: CardView(
                        title: "Suspended",
                        value: "2",
                        color: Colors.deepPurple,
                        icon: suspendedIcon,
                      ),
                    ),
                  ],
                ),
                mediumVerticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CardView(
                        color: Colors.orange,
                        title: "Delivered",
                        value: "126",
                        icon: deliveredIcon,
                      ),
                    ),
                    mediumHorizontalSpace,
                    Expanded(
                      child: CardView(
                        title: "Return",
                        value: "3",
                        color: Colors.lightBlue,
                        icon: cancel2Icon,
                      ),
                    ),
                  ],
                ),
                bigVerticalSpace,
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  title: ChartTitle(text: "Top 3 Wilayas in this year"),
                  series: [
                    ColumnSeries<WilayaChartData, String>(
                      dataSource: data,
                      xValueMapper: (WilayaChartData wilaya, _) => wilaya.x,
                      yValueMapper: (WilayaChartData wilaya, _) =>
                          wilaya.shipped,
                      color: Colors.redAccent,
                    ),
                    ColumnSeries<WilayaChartData, String>(
                      dataSource: data,
                      xValueMapper: (WilayaChartData wilaya, _) => wilaya.x,
                      yValueMapper: (WilayaChartData wilaya, _) =>
                          wilaya.delivered,
                      color: Colors.orange,
                    ),
                    ColumnSeries<WilayaChartData, String>(
                      dataSource: data,
                      xValueMapper: (WilayaChartData wilaya, _) => wilaya.x,
                      yValueMapper: (WilayaChartData wilaya, _) =>
                          wilaya.returned,
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                bigVerticalSpace,
                SfCircularChart(
                  title: ChartTitle(text:'Global Performance in this year' ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  palette: [
                    Colors.redAccent,
                    Colors.orange,
                    Colors.lightBlue,
                  ],
                  series: [
                    DoughnutSeries<WilayaChartData, String>(
                      dataSource: data,
                      xValueMapper: (wilaya, _) => wilaya.x,
                      yValueMapper: (wilaya, _) => wilaya.shipped,

                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CardView({
    required String title,
    required String value,
    required Color color,
    required String icon,
  }) {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              mediumHorizontalSpace,
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )),
                child: Image.asset(
                  icon,
                  height: 30,
                ),
              ),
            ],
          ),
          Row(
            children: [
              mediumHorizontalSpace,
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              smallHorizontalSpace,
              const Text(
                'package',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'To day',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              mediumHorizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}

class WilayaChartData {
  String x;
  double shipped;
  double delivered;
  double returned;

  WilayaChartData(this.x, this.delivered, this.shipped, this.returned);
}
