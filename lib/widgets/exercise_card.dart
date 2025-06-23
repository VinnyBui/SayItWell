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

    Icon getIcon() {
      switch (exercise.title) {
        case 'Tongue Twister':
          return Icon(Icons.speaker_notes, color: colorScheme.primary, size: 40);
        case 'Volume Control':
          return Icon(Icons.volume_up, color: colorScheme.secondary, size: 40);
        case 'Slow Down':
          return Icon(Icons.timer, color: colorScheme.tertiary, size: 40);
        case 'Repeat After Me':
          return Icon(Icons.repeat, color: colorScheme.onSurface, size: 40);
        default:
          return const Icon(Icons.fitness_center, color: Colors.grey, size: 40);
      }
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                //will shrink to fit only the space needed by its children (i.e. just enough height to wrap the content).
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getIcon(),
                  const SizedBox(height: 8),
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
      ),
    );
  }
}
