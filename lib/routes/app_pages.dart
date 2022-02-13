import 'package:get/get.dart';
import 'package:orders_task/screens/orders/bindings/orders_binding.dart';
import 'package:orders_task/screens/orders/views/orders_view.dart';

part 'app_routes.dart';

/// All Pages in app
class AppPages {
  static final routes = [
    GetPage(
      name: _Paths.ORDER,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    // GetPage(
    //   name: _Paths.STATISTICS,
    //   page: () => StatisticsView(),
    //   binding: StatisticsBinding(),
    // ),
  ];
}
