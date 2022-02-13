import 'package:intl/intl.dart';
import 'package:orders_task/models/order.dart';
import 'package:orders_task/routes/app_pages.dart';
import 'package:orders_task/screens/orders/controllers/orders_controller.dart';
import 'package:orders_task/utils/constants.dart';
import 'package:simple_tags/simple_tags.dart';

import '../../../index.dart';

class OrdersView extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      builder: (orderController) {
        return Scaffold(
          appBar: AppBar(
            title: Text("All Orders"),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Show Statistics",
            onPressed: () {
              orderController.extractRegisteredDate();
              Get.toNamed(Routes.STATISTICS,
                  arguments: orderController.ordersRegisteredDates);
            },
            child: Icon(Icons.insights),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10, start: 10, end: 10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3.h),
                            Text("Total Count: ${orderController.totalPrice}",
                                style: Theme.of(context).textTheme.subtitle1!),
                            SizedBox(height: 1.5.h),
                            Text(
                                "Average Price: ${orderController.averagePrice}",
                                style: Theme.of(context).textTheme.subtitle1!),
                            SizedBox(height: 1.5.h),
                            Text(
                                "Number Of Returns: ${orderController.ordersReturned}",
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderController.orders.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Order order = orderController.orders[index];
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, end: 10),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 10),
                                      child: Container(
                                        height: 15.h,
                                        width: 30.w,
                                        child: FadeInImage(
                                          image: NetworkImage(order.picture),
                                          placeholder: AssetImage(
                                              "assets/images/LazyLoadingHeader.png"),
                                          fit: BoxFit.cover,
                                          imageErrorBuilder: (BuildContext ctx,
                                              Object obj, StackTrace? s) {
                                            return Image.asset(
                                                "assets/images/error.jpeg");
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order #${order.id}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Company: ${order.company}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Buyer: ${order.buyer}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Price: ${order.price}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          SizedBox(height: 1.h),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: Container(
                                              padding:
                                                  EdgeInsetsDirectional.all(
                                                      5.0),
                                              color: (order.status) ==
                                                      Constants.returned
                                                  ? Colors.grey
                                                  : Colors.green,
                                              child: Text(
                                                order.status,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "${DateFormat().format(DateTime.parse(order.registered))}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h),
                              if (order.tags.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10),
                                  child: SimpleTags(
                                    content: order.tags,
                                    wrapSpacing: 4,
                                    wrapRunSpacing: 4,
                                    tagContainerPadding: EdgeInsets.all(10.0),
                                    tagTextStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                    tagContainerDecoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                ),
                              if (order.tags.isNotEmpty) SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
