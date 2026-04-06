import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final String? taskId;

  const TaskDetailScreen({super.key, this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görev Detayları'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.show_chart_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Görev No: $taskId',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('İstatistik ve geçmiş yakın zamanda eklenecek.'),
          ],
        ),
      ),
    );
  }
}
