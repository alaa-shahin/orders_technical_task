import 'package:orders_task/screens/orders/controllers/orders_controller.dart';

import '../../../index.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrdersController>(OrdersController());
  }
}
