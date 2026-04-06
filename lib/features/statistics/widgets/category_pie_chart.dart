import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoryPieChart extends StatefulWidget {
  final Map<String, int> categoryData; // Kategori adı -> Pomodoro sayısı

  const CategoryPieChart({super.key, required this.categoryData});

  @override
  State<CategoryPieChart> createState() => _CategoryPieChartState();
}

class _CategoryPieChartState extends State<CategoryPieChart> {
  int _touchedIndex = -1;

  // Kategori renkleri (sıradüzenli atama)
  static const List<Color> _colors = [
    Color(0xFF4A90E2),
    Color(0xFFF5A623),
    Color(0xFF7ED321),
    Color(0xFFBD10E0),
    Color(0xFFFF6B6B),
    Color(0xFF50E3C2),
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.categoryData.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text('Henüz kategori verisi yok.')),
      );
    }

    final entries = widget.categoryData.entries.toList();
    final total = entries.fold<int>(0, (sum, e) => sum + e.value);

    return Row(
      children: [
        // Pasta grafik
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (event, resp) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          resp == null ||
                          resp.touchedSection == null) {
                        _touchedIndex = -1;
                        return;
                      }
                      _touchedIndex = resp.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: List.generate(entries.length, (i) {
                  final isTouched = i == _touchedIndex;
                  final pct = (entries[i].value / total * 100).toStringAsFixed(1);
                  return PieChartSectionData(
                    color: _colors[i % _colors.length],
                    value: entries[i].value.toDouble(),
                    title: isTouched ? '$pct%' : '',
                    radius: isTouched ? 55.0 : 45.0,
                    titleStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        // Lejant
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(entries.length, (i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _colors[i % _colors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        entries[i].key,
                        style: const TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${entries[i].value}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
