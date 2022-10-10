import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_ecommerce_backend/controllers/controllers.dart';
import 'package:max_ecommerce_backend/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: orderController.pendingOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(
                    order: orderController.pendingOrders[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
