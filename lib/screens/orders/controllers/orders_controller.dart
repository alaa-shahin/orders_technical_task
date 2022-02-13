import 'package:orders_task/models/order.dart';
import 'package:orders_task/utils/constants.dart';

import '../../../index.dart';
import '../../../main.dart';

class OrdersController extends GetxController {
  List<Order> orders = [];
  List<String> ordersRegisteredDates = [];
  var reg = RegExp(r'[^\w\s]+');
  int totalPrice = 0;
  double averagePrice = 0.0;
  int ordersReturned = 0;

  /// Calc all price
  int totalCount() {
    int total = 0;
    for (int i = 0; i < orders.length; i++) {
      total += int.parse(orders[i].price.replaceAll(reg, ''));
    }
    return total;
  }

  /// Calc number of returns
  int numberOfReturns() {
    int num = 0;
    orders.forEach((element) {
      if (element.status == Constants.returned) {
        num++;
      }
    });
    return num;
  }

  /// Calc average price
  double averagePriceCalc() {
    double average = totalPrice / orders.length;
    return average;
  }

  /// extract registered date to pass it statistics screen
  void extractRegisteredDate() {
    orders.forEach((element) {
      ordersRegisteredDates.add(element.registered);
    });
  }

  @override
  void onInit() {
    orders = List<Order>.from(data.map((e) => Order.fromJson(e)));
    super.onInit();
  }

  @override
  void onReady() {
    totalPrice = totalCount();
    averagePrice = averagePriceCalc();
    ordersReturned = numberOfReturns();
    update();
    super.onReady();
  }
}
