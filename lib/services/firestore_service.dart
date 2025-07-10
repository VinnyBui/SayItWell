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

  // Save daily exercises for current user
  Future<void> saveDailyExercises(List<Exercise> exercises) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final today = DateTime.now();
    final dateKey =
      '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

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

  // Get daily exercises for current user and today's date
  Future<List<Exercise>?> getTodaysDailyExercises() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final today = DateTime.now();
    final dateKey =
      '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

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
}
