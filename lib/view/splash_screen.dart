import 'dart:async';
import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFF0B1E4E),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg',
            width: 400,
            height: 400,
            fit: BoxFit.contain,
            ),
            SizedBox(height: 20,
            ),
            Text('Where Every Question is an Adventure!',
            style: TextStyle(
              color:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
             Text("Ready. Set. Quest!",
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