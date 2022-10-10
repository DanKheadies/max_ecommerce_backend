import 'package:get/get.dart';

import 'package:max_ecommerce_backend/models/models.dart';
import 'package:max_ecommerce_backend/services/services.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  void updateOrder(
    Order order,
    String field,
    bool value,
  ) {
    database.updateOrder(
      order,
      field,
      value,
    );
  }
}
