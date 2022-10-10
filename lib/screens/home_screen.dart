import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:max_ecommerce_backend/controllers/controllers.dart';
import 'package:max_ecommerce_backend/models/models.dart';
import 'package:max_ecommerce_backend/screens/screens.dart';
import 'package:max_ecommerce_backend/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dankery'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: orderStatsController.stats.value,
              builder: (BuildContext context,
                  AsyncSnapshot<List<OrderStats>> snapshot) {
                if (snapshot.hasData) {
                  return CustomBarChart(
                    orderStats: snapshot.data!,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductsScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Products'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => OrdersScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Orders'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
