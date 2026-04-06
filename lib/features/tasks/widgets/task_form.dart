import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskForm extends ConsumerStatefulWidget {
  const TaskForm({super.key});

  @override
  ConsumerState<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  int _targetPomodoros = 1;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_titleController.text.trim().isEmpty) return;

    final newTask = Task()
      ..title = _titleController.text.trim()
      ..description = _descController.text.trim()
      ..targetPomodoros = _targetPomodoros;

    ref.read(taskListProvider.notifier).addTask(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Kategori verileri hazırlandığında eklenecek, asıl işlevi kuruyoruz
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        // Klavye açılınca çakışmaması için bottom padding
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Çizgi
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          TextField(
            controller: _titleController,
            autofocus: true,
            style: theme.textTheme.titleLarge,
            decoration: InputDecoration(
              hintText: 'Ne üzerinde çalışacaksın?',
              border: InputBorder.none,
              hintStyle: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ),
          ),
          
          const Divider(),
          
          TextField(
            controller: _descController,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Açıklama (İsteğe Bağlı)',
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ),
          ),

          const SizedBox(height: 16),
          
          Row(
            children: [
              Text(
                'Hedef Pomodoro',
                style: theme.textTheme.titleMedium,
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (_targetPomodoros > 1) {
                        setState(() => _targetPomodoros--);
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$_targetPomodoros',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_targetPomodoros < 10) {
                        setState(() => _targetPomodoros++);
                      }
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 24),

          FilledButton(
            onPressed: _saveTask,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Görevi Kaydet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
