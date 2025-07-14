import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/exercise.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateUserDisplayName(User user, String? displayName) async {
    await _firestore.collection('users').doc(user.uid).update({
      'displayName': displayName,
    });
  }

  Future<void> saveDailyExercises(
    List<Exercise> exercises,
    DateTime date,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final dateKey =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('daily_exercises')
        .doc() // Auto-generated ID
        .set({
          'exercises': exercises.map((e) => e.toMap()).toList(),
          'createdAt': FieldValue.serverTimestamp(),
          'date': dateKey,
          'userId': user.uid,
        });
  }

  Future<List<Exercise>?> getDailyExercisesForDate(DateTime date) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final dateKey =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    final querySnapshot =
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('daily_exercises')
            .where('date', isEqualTo: dateKey)
            .limit(1)
            .get();

    if (querySnapshot.docs.isEmpty) return null;

    final data = querySnapshot.docs.first.data();
    if (data['exercises'] == null) return null;

    final exercisesList = data['exercises'] as List<dynamic>;
    return exercisesList
        .map(
          (exerciseMap) =>
              Exercise.fromMap(exerciseMap as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> markExerciseAsCompleted(String exerciseId, DateTime date) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final dateKey =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    // Get the exercises document for the specified date
    final querySnapshot =
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('daily_exercises')
            .where('date', isEqualTo: dateKey)
            .limit(1)
            .get();

    if (querySnapshot.docs.isEmpty) return;

    final doc = querySnapshot.docs.first;
    final data = doc.data();
    final exercises = List<Map<String, dynamic>>.from(data['exercises'] ?? []);

    // Find and update the specific exercise
    for (int i = 0; i < exercises.length; i++) {
      if (exercises[i]['id'] == exerciseId) {
        exercises[i]['completed'] = true;
        break;
      }
    }

    // Update the document
    await doc.reference.update({'exercises': exercises});
  }

  Future<DateTime?> getUserAccountCreationDate() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    try {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists) return null;

      final data = userDoc.data();
      final createdAt = data?['createdAt'] as Timestamp?;

      return createdAt?.toDate();
    } catch (e) {
      return user.metadata.creationTime;
    }
  }
}
