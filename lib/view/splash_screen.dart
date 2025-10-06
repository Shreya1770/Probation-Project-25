import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/services/login_page.dart';
import 'package:quizapp/services/signup_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()),);


    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 59, 186),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/quiz.jpg',
            width: 400,
            height: 400,
            fit: BoxFit.contain,
            ),
            SizedBox(height: 20,
            ),
            Text('QuizQuest',
            style: TextStyle(
              color:Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 20,
            ),
             Text("Let's Play",
            style: TextStyle(
              color:Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
             ),
          ],
        ),
      ),
    );
  }
}