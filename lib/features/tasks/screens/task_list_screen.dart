import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';
import '../widgets/task_form.dart';
import '../../timer/providers/timer_notifier.dart';
import 'package:go_router/go_router.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Görevler',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: tasksAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_turned_in_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Henüz odaklanılacak bir görev yok.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(
                task: task,
                onTap: () {
                  // İleride detay sayfasına gidebilir
                },
                onToggle: () {
                  ref.read(taskListProvider.notifier).toggleTaskCompletion(task.id);
                },
                onPlay: () {
                  // Görevi aktif görev olarak Timer'a gönder
                  ref.read(timerNotifierProvider.notifier).setActiveTask(task);
                  // Kullanıcıyı Timer sekmesine taşı (go_router navigation)
                  context.go('/timer');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Hata: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Bottom Sheet olarak Görev Formunu açıyoruz
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // klavye yukarısına taşıması için
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) => const TaskForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
