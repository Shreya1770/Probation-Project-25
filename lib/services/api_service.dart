import 'dart:convert';
import 'package:http/http.dart' as http;

class TriviaQuestion{
  final String question;
  final String answer;
  TriviaQuestion({required this.question,required this.answer});
  factory TriviaQuestion.fromJson(Map<String,dynamic>json){
    return TriviaQuestion(question: json['question']?? 'No Question Found',
     answer: json['answer']??'No Answer Found',
     );
  }
}
class ApiService{
  final String apiKey= "Fin6MYqo0JEvWZnfxmAYug==lRSZCVYRCpRN7B1W";
  Future<List<TriviaQuestion>> fetchTrivia({int limit=10})async{
    final uri = Uri.parse('https://api-ninjas.com/api/trivia?limit=$limit');
    final response = await http.get(uri,headers:{'X-Api-Key':apiKey});

    if(response.statusCode==200){
      final List<dynamic> data=json.decode(response.body);
      return data.map((q)=>TriviaQuestion.fromJson(q)).toList();
    }
    else{
      throw Exception('Failed to load Trivia');
    }
  }
}