import 'package:flutter/material.dart';
import '../../models/exercise.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseStartScreen({super.key, required this.exercise});

  @override
  State<ExerciseStartScreen> createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Icon getIcon() {
      switch (widget.exercise.title) {
        case 'Tongue Twister':
          return Icon(
            Icons.speaker_notes,
            color: colorScheme.primary,
            size: 80,
          );
        case 'Volume Control':
          return Icon(Icons.volume_up, color: colorScheme.secondary, size: 80);
        case 'Slow Down':
          return Icon(Icons.timer, color: colorScheme.tertiary, size: 80);
        case 'Repeat After Me':
          return Icon(Icons.repeat, color: colorScheme.onSurface, size: 80);
        default:
          return const Icon(Icons.fitness_center, color: Colors.grey, size: 80);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.exercise.title,
          style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(child: getIcon()),
            const SizedBox(height: 40),
            Text(
              widget.exercise.title,
              style: textTheme.headlineLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              widget.exercise.description,
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.exercise.duration} minutes',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //Spacer takes up the remaining space
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: Start the exercise
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Starting ${widget.exercise.title}...'),
                    backgroundColor: colorScheme.primary,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Start Exercise',
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
