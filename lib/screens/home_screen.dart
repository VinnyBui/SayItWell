import 'package:flutter/material.dart';
import '../widgets/exercise_card.dart';
import '../data/sample_exercises.dart';
import 'progress_screen.dart';
import 'premium_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Excercises',
          style: textTheme.displayLarge?.copyWith(
            color: colorScheme.primary,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.notifications_none, color: colorScheme.onPrimary),
          //   tooltip: 'Notifications',
          //   onPressed: () {
          //     // TODO: notification action
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24), // your top spacing
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3/5,
                physics: const BouncingScrollPhysics(),
                children: SampleExercises.exercises
                    .map((exercise) => ExerciseCard(exercise: exercise))
                    .toList(),
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            // Already on home screen
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                        const ProgressScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 200),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                        const PremiumScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 200),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                        const SettingsScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 200),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
