import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/theme/theme_palettes.dart';
import '../models/app_settings.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late AppSettings _stagedSettings;

  // Özel Palet Seçenekleri (Sadece Mavi ve Yeşil)
  final List<int?> _paletteIds = [
    TimerPalette.blueTeal.id, // Mavi/Açık Mavi Gradient
    TimerPalette.darkGreen.id, // Koyu Yeşil
  ];

  @override
  void initState() {
    super.initState();
    _stagedSettings = ref.read(settingsProvider);
    
    // Eğer şu anki ayar bej ise (kaldırılan renk), varsayılana çek
    if (_stagedSettings.customBackgroundColor != TimerPalette.blueTeal.id && 
        _stagedSettings.customBackgroundColor != TimerPalette.darkGreen.id) {
       _stagedSettings = _stagedSettings.copyWith(customBackgroundColor: TimerPalette.blueTeal.id);
    }
  }

  void _saveSettings() {
    ref.read(settingsProvider.notifier).updateSettings(_stagedSettings);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ayarlar kaydedildi')),
    );
  }

  void _showNumberPicker({
    required String title,
    required int currentValue,
    required int min,
    required int max,
    required ValueChanged<int> onChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        int selected = currentValue;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: selected > min ? () => setState(() => selected--) : null,
                        icon: const Icon(Icons.remove_circle_outline),
                        iconSize: 32,
                      ),
                      const SizedBox(width: 24),
                      Text('$selected dk', style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 24),
                      IconButton(
                        onPressed: selected < max ? () => setState(() => selected++) : null,
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      onChanged(selected);
                      Navigator.pop(context);
                    },
                    child: const Text('Tamam'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        actions: [
          IconButton(
            onPressed: () => _saveSettings(),
            icon: const Icon(Icons.save_rounded),
            tooltip: 'Kaydet',
          ),
        ],
      ),
      body: ListView(
        children: [
          // ZAMANLAYICI AYARLARI
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Zamanlayıcı (Dakika)',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Pomodoro Süresi'),
            subtitle: Text('${_stagedSettings.pomodoroLength} dk'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showNumberPicker(
                title: 'Pomodoro Süresi',
                currentValue: _stagedSettings.pomodoroLength,
                min: 5,
                max: 60,
                onChanged: (val) {
                  setState(() {
                    _stagedSettings = _stagedSettings.copyWith(pomodoroLength: val);
                  });
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Kısa Mola'),
            subtitle: Text('${_stagedSettings.shortBreakLength} dk'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showNumberPicker(
                title: 'Kısa Mola Süresi',
                currentValue: _stagedSettings.shortBreakLength,
                min: 1,
                max: 15,
                onChanged: (val) {
                  setState(() {
                    _stagedSettings = _stagedSettings.copyWith(shortBreakLength: val);
                  });
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Uzun Mola'),
            subtitle: Text('${_stagedSettings.longBreakLength} dk'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showNumberPicker(
                title: 'Uzun Mola Süresi',
                currentValue: _stagedSettings.longBreakLength,
                min: 5,
                max: 30,
                onChanged: (val) {
                  setState(() {
                    _stagedSettings = _stagedSettings.copyWith(longBreakLength: val);
                  });
                },
              );
            },
          ),

          // TEMA AYARLARI
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Text(
              'Görünüm',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Tema'),
            trailing: SegmentedButton<ThemeMode>(
              emptySelectionAllowed: false,
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.brightness_auto),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: Icon(Icons.dark_mode),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                ref.read(themeModeProvider.notifier).setThemeMode(newSelection.first);
              },
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Arka Plan Rengi'),
            subtitle: const Text('Uygulama renk paletini seçin'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 16,
              children: _paletteIds.map((id) {
                final isSelected = _stagedSettings.customBackgroundColor == id;
                final palette = TimerPalette.fromId(id);
                if (palette == null) return const SizedBox();
                
                final displayColor = palette.isGradient ? palette.backgroundGradient[0] : palette.backgroundColor;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _stagedSettings = _stagedSettings.copyWith(customBackgroundColor: id);
                    });
                    ref.read(settingsProvider.notifier).updateSettings(_stagedSettings);
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: displayColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
                        width: isSelected ? 3 : 1,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(alpha: 0.4),
                            blurRadius: 8,
                          )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
