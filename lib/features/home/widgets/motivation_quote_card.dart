import 'package:flutter/material.dart';
import 'dart:math';

class MotivationQuoteCard extends StatefulWidget {
  const MotivationQuoteCard({super.key});

  @override
  State<MotivationQuoteCard> createState() => _MotivationQuoteCardState();
}

class _MotivationQuoteCardState extends State<MotivationQuoteCard> {
  late final String _selectedQuote;

  static const List<String> _quotes = [
    "Bugün ne ekersen, yarın onu biçersin.",
    "Büyük işler küçük adımlarla başlar.",
    "Zaman kontrol edemediğin tek kaynaktır.",
    "Başarı bir varış noktası değil, bir yolculuktur.",
    "Odaklan, inan ve başar.",
    "Daha iyi olmak için asla geç değildir.",
    "Ertelemek, potansiyelinin sessiz katilidir.",
    "Hayaller hedeflere, hedefler gerçeğe dönüşsün."
  ];

  @override
  void initState() {
    super.initState();
    final random = Random();
    _selectedQuote = _quotes[random.nextInt(_quotes.length)];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.format_quote_rounded,
            size: 32,
            color: theme.colorScheme.tertiary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _selectedQuote,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.tertiary,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
