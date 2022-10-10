import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:max_ecommerce_backend/models/models.dart';

class CustomBarChart extends StatelessWidget {
  final List<OrderStats> orderStats;

  const CustomBarChart({
    Key? key,
    required this.orderStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(
        text: 'Orders',
      ),
      legend: Legend(
          // isVisible: true,
          ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      series: <ChartSeries<OrderStats, String>>[
        ColumnSeries<OrderStats, String>(
          dataSource: orderStats,
          xValueMapper: (orderStats, _) => orderStats.index.toString(),
          yValueMapper: (orderStats, _) => orderStats.orders,
          name: 'Derp',
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
        ),
      ],
    );
  }
}
