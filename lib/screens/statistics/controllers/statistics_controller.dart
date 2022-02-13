import 'package:intl/intl.dart';

import '../../../index.dart';

class StatisticsController extends GetxController {
  List<String> ordersRegisteredDates = [];
  Map<String, int> months = {
    "Jan": 0,
    "Feb": 0,
    "Mar": 0,
    "Apr": 0,
    "May": 0,
    "Jun": 0,
    "Jul": 0,
    "Aug": 0,
    "Sep": 0,
    "Oct": 0,
    "Nov": 0,
    "Dec": 0,
  };

  /// update months map to display in graph
  updateMonths() {
    ordersRegisteredDates.map((element) {
      var month = DateFormat.MMM().format(DateTime.parse(element));
      if (months.containsKey(month)) {
        months.update(month, (value) => ++value);
      }
    }).toList();
  }

  @override
  void onInit() {
    ordersRegisteredDates = Get.arguments;
    updateMonths();
    super.onInit();
  }

  @override
  void onClose() {
    ordersRegisteredDates.clear();
    super.onClose();
  }
}
