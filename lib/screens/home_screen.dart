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
  int selectedIndex = 0;

  // List of screens/widgets for each tab
  final List<Widget> _screens = [
    const HomeContent(),
    const ProgressScreen(),
    const PremiumScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          'SayItWell',
          style: textTheme.headlineLarge?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: colorScheme.onPrimary),
            tooltip: 'Notifications',
            onPressed: () {
              // TODO: notification action
            },
          ),
        ],
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
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

// Home Content Widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Today's Exercises",
            style: textTheme.headlineLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          ExerciseCard(exercise: SampleExercises.exercises[0]),
          ExerciseCard(exercise: SampleExercises.exercises[1]),
          ExerciseCard(exercise: SampleExercises.exercises[2]),
          ExerciseCard(exercise: SampleExercises.exercises[3]),
          const SizedBox(height: 24),
          Text(
            "Stay consistent and improve your clarity every day.",
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
