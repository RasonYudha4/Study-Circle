import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_circle/class/models/quiz.dart';

class QuizService {
  final CollectionReference _quizCollection =
      FirebaseFirestore.instance.collection('quizzes');

  Future<List<Quiz>> getAllQuizzes() async {
    try {
      QuerySnapshot snapshot = await _quizCollection.get();
      return snapshot.docs.map((doc) {
        return Quiz.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching quizzes: $e");
      return [];
    }
  }

  Future<List<Quiz>> getAllQuizByGroupId(String groupId) async {
    try {
      QuerySnapshot snapshot =
          await _quizCollection.where("groupId", isEqualTo: groupId).get();
      List<Quiz> quizzes = snapshot.docs.map((doc) {
        return Quiz.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return quizzes;
    } catch (e) {
      return [];
    }
  }

  Future<void> updateQuizScore(String id, String userId, int newScore) async {
    try {
      DocumentSnapshot snapshot = await _quizCollection.doc(id).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        Map<String, int> scores = Map<String, int>.from(data['scores'] ?? {});

        scores[userId] = newScore;

        await _quizCollection.doc(id).update({
          'scores': scores,
        });
      } else {
        print("Quiz document does not exist.");
      }
    } catch (e) {
      print("Error updating quiz: $e");
    }
  }

  Future<void> deleteAllQuizzes() async {
    QuerySnapshot snapshot = await _quizCollection.get();
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  Future<void> createQuiz(Quiz quiz) async {
    try {
      await _quizCollection.add(quiz.toMap());
      print("Quiz created successfully!");
    } catch (e) {
      print("Error creating quiz: $e");
    }
  }

  Future<void> deleteQuiz(String quizId) async {
    try {
      await _quizCollection.doc(quizId).delete();
      print("Quiz deleted successfully!");
    } catch (e) {
      print("Error deleting quiz: $e");
    }
  }

  Future<Quiz?> getQuizById(String quizId) async {
    try {
      DocumentSnapshot doc = await _quizCollection.doc(quizId).get();
      if (doc.exists) {
        return Quiz.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        print("Quiz not found");
        return null;
      }
    } catch (e) {
      print("Error fetching quiz: $e");
      return null;
    }
  }
}
