import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseSessionViewCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onComplete;

  const ExerciseSessionViewCard({
    super.key,
    required this.exercise,
    required this.onComplete,
  });

  List<Color> _getGradientColors() {
    switch (exercise.title) {
      case 'Tongue Twister':
        return [const Color(0xFF667eea), const Color(0xFF764ba2)];
      case 'Volume Control':
        return [const Color(0xFFf093fb), const Color(0xFFf5576c)];
      case 'Slow Down':
        return [const Color(0xFF4facfe), const Color(0xFF00f2fe)];
      case 'Repeat After Me':
        return [const Color(0xFF43e97b), const Color(0xFF38f9d7)];
      default:
        return [const Color(0xFF667eea), const Color(0xFF764ba2)];
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Exercise content
          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    exercise.content,
                    style: textTheme.headlineMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.4,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          // Complete button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onComplete,
              style: ElevatedButton.styleFrom(
                backgroundColor: _getGradientColors()[0],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Complete Exercise', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.check, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
