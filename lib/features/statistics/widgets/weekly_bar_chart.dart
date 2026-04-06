import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyBarChart extends StatelessWidget {
  final Map<int, int> weeklyData; // Gün (1-7), Dakika
  final Color barColor;

  const WeeklyBarChart({
    super.key,
    required this.weeklyData,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    // Verileri bar formatına çevir
    List<BarChartGroupData> barGroups = [];
    int maxMinutes = 1; // 0'a bölme hatasını engellemek için

    for (int i = 1; i <= 7; i++) {
      int minutes = weeklyData[i] ?? 0;
      if (minutes > maxMinutes) maxMinutes = minutes;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: minutes.toDouble(),
              color: barColor,
              width: 16,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: (maxMinutes * 1.2).toDouble() < 60 ? 60 : (maxMinutes * 1.2).toDouble(),
                color: barColor.withValues(alpha: 0.1), // Arka plan çubuğu izi
              ),
            ),
          ],
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: (maxMinutes * 1.2).toDouble() < 60 ? 60 : (maxMinutes * 1.2).toDouble(),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Theme.of(context).colorScheme.inverseSurface,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${rod.toY.round()} dk',
                  TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, _) {
                  const style = TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 1: text = 'Pzt'; break;
                    case 2: text = 'Sal'; break;
                    case 3: text = 'Çar'; break;
                    case 4: text = 'Per'; break;
                    case 5: text = 'Cum'; break;
                    case 6: text = 'Cmt'; break;
                    case 7: text = 'Paz'; break;
                    default: text = ''; break;
                  }
                  return SideTitleWidget(
                    axisSide: AxisSide.bottom,
                    space: 4,
                    child: Text(text, style: style),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
        ),
      ),
    );
  }
}
