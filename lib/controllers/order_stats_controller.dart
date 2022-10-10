import 'package:get/get.dart';

import 'package:max_ecommerce_backend/models/models.dart';
import 'package:max_ecommerce_backend/services/services.dart';

class OrderStatsController extends GetxController {
  final DatabaseService database = DatabaseService();

  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = database.getOrderStats();
    super.onInit();
  }
}
