import 'package:flutter/material.dart';
import '../../../models/exercise.dart';
import 'exercise_session_screen.dart';

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

    // Get gradient colors based on exercise type
    List<Color> getGradientColors() {
      switch (widget.exercise.title) {
        case 'Tongue Twister':
          return [const Color(0xFF667eea), const Color(0xFF764ba2)];
        case 'Volume Control':
          return [const Color(0xFFf093fb), const Color(0xFFf5576c)];
        case 'Slow Down':
          return [const Color(0xFF4facfe), const Color(0xFF00f2fe)];
        case 'Repeat After Me':
          return [const Color(0xFF43e97b), const Color(0xFF38f9d7)];
        default:
          return [colorScheme.primary, colorScheme.secondary];
      }
    }

    Icon getIcon() {
      switch (widget.exercise.title) {
        case 'Tongue Twister':
          return const Icon(Icons.speaker_notes, color: Colors.white, size: 80);
        case 'Volume Control':
          return const Icon(Icons.volume_up, color: Colors.white, size: 80);
        case 'Slow Down':
          return const Icon(Icons.timer, color: Colors.white, size: 80);
        case 'Repeat After Me':
          return const Icon(Icons.repeat, color: Colors.white, size: 80);
        default:
          return const Icon(
            Icons.fitness_center,
            color: Colors.white,
            size: 80,
          );
      }
    }

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
      ),
      body: Column(
        children: [
          // Hero section with gradient background
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: getGradientColors(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Icon in a circular container
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: getIcon(),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.exercise.title,
                    style: textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.exercise.description,
                    style: textTheme.bodyLarge?.copyWith(
                      color: const Color.fromRGBO(255, 255, 255, 0.9),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Content section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  // Duration card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(102, 126, 234, 0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color.fromRGBO(102, 126, 234, 0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(102, 126, 234, 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.timer,
                            color: Color(0xFF667eea),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${widget.exercise.duration} minutes',
                          style: textTheme.titleLarge?.copyWith(
                            color: const Color(0xFF667eea),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Instructions or tips section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Tips for Success',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Find a quiet space, take deep breaths, and focus on clear pronunciation. Practice makes perfect!',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Start button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseSessionScreen(
                              exercise: widget.exercise,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF667eea),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_arrow, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Start Exercise',
                            style: textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
