import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback? onTap;

  const ExerciseCard({super.key, required this.exercise, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Color getCardColor(String title) {
      switch (title) {
        case 'Tongue Twister Clarity':
          return colorScheme.secondary; // Coral
        case 'Volume/Projection Drill':
          return Color(0xFFFFC107); // Teal
        case 'Slow-Down Drill':
          return const Color(0xFFFFC107); // Soft Purple
        case 'Repeat After Me':
          return Color(0xFFFDD835); // Yellow
        default:
          return Theme.of(context).colorScheme.primary.withOpacity(0.1); // Fallback
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.title,
                  style: textTheme.headlineMedium?.copyWith(),
                ),
                const SizedBox(height: 8),
                Text(
                  exercise.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${exercise.duration} min',
                  style: textTheme.bodySmall?.copyWith(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
