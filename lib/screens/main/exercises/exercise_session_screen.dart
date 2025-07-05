import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/exercise.dart';
import '../../../widgets/exercise_session_view_card.dart';

class ExerciseSessionScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseSessionScreen({super.key, required this.exercise});

  @override
  State<ExerciseSessionScreen> createState() => _ExerciseSessionScreenState();
}

class _ExerciseSessionScreenState extends State<ExerciseSessionScreen> {
  bool _isCompleted = false;

  void _completeExercise() {
    setState(() {
      _isCompleted = true;
    });

    // Provide haptic feedback
    HapticFeedback.lightImpact();

    // Show completion dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Exercise Complete!'),
            content: Text(
              'Great job completing the ${widget.exercise.title} exercise!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(); // Go back to details screen
                  Navigator.of(context).pop(); // Go back to home screen
                },
                child: const Text('Done'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.exercise.title,
          style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary),
        ),
        actions: [],
      ),
      body: ExerciseSessionViewCard(
        exercise: widget.exercise,
        onComplete: _completeExercise,
      ),
    );
  }
}
