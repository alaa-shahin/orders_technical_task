import 'package:orders_task/screens/statistics/controllers/statistics_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../index.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Statistics'),
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(
          text: 'Yearly Orders Analysis',
          textStyle: Theme.of(context).textTheme.headline6,
        ),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          ColumnSeries<MapEntry, String>(
            dataSource: controller.months.entries
                .map((e) => MapEntry(e.key, e.value))
                .toList(),
            xValueMapper: (MapEntry order, _) => order.key,
            yValueMapper: (MapEntry order, _) => order.value,
            name: 'Orders',
            // Enable data label
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
