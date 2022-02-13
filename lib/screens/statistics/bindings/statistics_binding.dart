import 'package:orders_task/screens/statistics/controllers/statistics_controller.dart';

import '../../../index.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StatisticsController>(StatisticsController());
  }
}
