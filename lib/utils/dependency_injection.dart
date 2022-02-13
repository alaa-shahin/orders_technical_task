import 'package:orders_task/screens/orders/controllers/orders_controller.dart';

import '../index.dart';

addDependency() {
  Get.put(OrdersController());
  // Get.lazyPut<StatisticsController>(() => StatisticsController());
}
