import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp/view/quiz_screen.dart';

class Leaderboard extends StatelessWidget {
  final int score;
  const Leaderboard({super.key,required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Leader Board',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Expanded(child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
          .collection('leaderboard')
          .orderBy('score',descending: true)
          .snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return const Center(child: Text("No leaderboard data found"));

            }
            final users = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(user['email']),
                      trailing: Text("Score: ${user['score']}"),
                    );
                  },
                );

          }
        ),),
        ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );
  },
  child: const Text("Play Again"),
),
      ],

      ),
  
    );
  }
}