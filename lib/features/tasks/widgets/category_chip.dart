import 'package:flutter/material.dart';
import '../models/task_category.dart';

class CategoryChip extends StatelessWidget {
  final TaskCategory category;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.category,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Isar'dan dönen color hex string'ini Color objesine çevirmek gerek:
    Color catColor = _hexToColor(category.colorHex);
    
    return ActionChip(
      onPressed: onTap,
      label: Text(
        category.name,
        style: TextStyle(
          color: isSelected ? Colors.white : catColor,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      avatar: Icon(
        // İleride iconManager eklenebilir, şimdilik statik tag ikonu:
        Icons.local_offer_rounded,
        size: 16,
        color: isSelected ? Colors.white : catColor,
      ),
      backgroundColor: isSelected ? catColor : catColor.withValues(alpha: 0.1),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
