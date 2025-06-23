import '../models/exercise.dart';

class SampleExercises {
  static List<Exercise> exercises = [
    Exercise(
      id: '1',
      title: 'Tongue Twister',
      description:
          'Practice clear pronunciation with challenging tongue twisters to improve speech clarity and articulation.',
      type: 'tongue_twister',
      duration: 3,
      completed: false,
    ),
    Exercise(
      id: '2',
      title: 'Volume / Projection',
      description:
          'Learn to project your voice effectively and control volume for better communication in different settings.',
      type: 'volume',
      duration: 4,
      completed: false,
    ),
    Exercise(
      id: '3',
      title: 'Slow Down',
      description:
          'Practice speaking at a controlled pace to improve clarity and reduce speech rate issues.',
      type: 'pace',
      duration: 2,
      completed: false,
    ),
    Exercise(
      id: '4',
      title: 'Repeat After Me',
      description:
          'Follow along with clear speech patterns to improve pronunciation and rhythm.',
      type: 'repetition',
      duration: 3,
      completed: false,
    ),
  ];
}
