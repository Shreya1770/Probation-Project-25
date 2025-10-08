import 'package:flutter/material.dart';
import 'package:quizapp/services/api_service.dart';
import 'package:quizapp/view/leaderboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final ApiService _apiService = ApiService();
  List<TriviaQuestion> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _apiService.fetchTrivia(limit: 10);
      setState(() {
        _questions = questions;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching trivia: $e");
    }
  }

  void _checkAnswer(String selectedAnswer) {
    final correctAnswer = _questions[_currentIndex].correctAnswer;
    if (selectedAnswer == correctAnswer) {
      _score++;
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _saveScore();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Leaderboard(score: _score),
        ),
      );
    }
  }

  void _saveScore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('leaderboard').add({
        'uid': user.uid,
        'email': user.email,
        'score': _score,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz ${_currentIndex + 1}/${_questions.length}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...question.options.map(
              (option) => Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
