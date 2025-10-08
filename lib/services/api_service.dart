import 'dart:convert';
import 'package:http/http.dart' as http;

// Model for a trivia question
class TriviaQuestion {
  final String question;
  final String correctAnswer;
  final List<String> options;

  TriviaQuestion({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory TriviaQuestion.fromJson(Map<String, dynamic> json) {
    // OpenTDB uses HTML entities, so decode them safely
    String decode(String text) =>
        text.replaceAll('&quot;', '"').replaceAll('&#039;', "'");

    // Get incorrect + correct answers
    List<String> options =
        List<String>.from(json['incorrect_answers'].map((a) => decode(a)));
    options.add(decode(json['correct_answer']));
    options.shuffle();

    return TriviaQuestion(
      question: decode(json['question'] ?? 'No question'),
      correctAnswer: decode(json['correct_answer'] ?? 'No answer'),
      options: options,
    );
  }
}

class ApiService {
  Future<List<TriviaQuestion>> fetchTrivia({int limit = 10}) async {
    final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=$limit&type=multiple'); // free trivia API

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List results = data['results'];
        return results.map((q) => TriviaQuestion.fromJson(q)).toList();
      } else {
        throw Exception('Failed to load trivia: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching trivia: $e');
    }
  }
}
