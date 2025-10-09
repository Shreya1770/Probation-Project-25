import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/services/signup_page.dart';
import 'package:quizapp/view/quiz_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email='', password='';
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey=GlobalKey<FormState>();
  bool _obscuretext=true;

  userLogin() async{
    if(password!= "" && mailcontroller.text!=""){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfully',style: TextStyle(fontSize: 20.0),),
        duration: Duration(seconds: 2),));

        await Future.delayed(const Duration(seconds: 2));


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QuizScreen()));

      } on FirebaseAuthException catch(e){
        if(e.code=='user-not-found'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.orangeAccent,
          content: Text('No User Found With That Email',style: TextStyle(fontSize: 20.0),),
          duration: Duration(seconds: 2), ));
        }
        else if(e.code=='wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.orangeAccent,content: Text('Wrong Password Provided By User', style: TextStyle(fontSize: 20.0),
          ),
          duration: Duration(seconds: 2),));
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/loginimage.jpg',
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color.fromARGB(255, 23, 71, 154), width: 2),
                      ),
                      child: TextFormField(
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'Please Enter email';
                          }
                          return null;
                        },
                        controller: mailcontroller,
                        decoration: InputDecoration(
                         hintText: "Email",
                         hintStyle: TextStyle(
                          color: Color(0xFFb2b7bf),
                          fontSize: 18.0
                         ),
                       border:InputBorder.none,

        
                        ),
                        
                      ),
                     
                    ),
                     SizedBox(height: 30.0,),
        
                     Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color.fromARGB(255, 23, 71, 154), width: 2),
        
                      ),
                      child: TextFormField(
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        controller: passwordcontroller,
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                         hintText: "Password",
                         hintStyle: TextStyle(
                          color: Color(0xFFb2b7bf),
                          fontSize: 18.0,
                        
                         ),
                         border: InputBorder.none,
                         suffixIcon: IconButton( 
                          icon:Icon(
                            _obscuretext?Icons.visibility_off
                            :Icons.visibility,
                            color: Colors.grey[700],


                          ),
                          onPressed:(){
                            setState(() {
                              _obscuretext=!_obscuretext;
                            });
                          } ,)
        
                        ),
                        
                      ),
                     
                    ),
                     SizedBox(height: 30.0,),
                      GestureDetector(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          email=mailcontroller.text;
                          password=passwordcontroller.text;
                        });
                      }
                      userLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 24, 97, 156),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blueAccent, width: 2),
         
        
                      ),
                      child:Text('Login',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),
                    ),
                    
                  ),
                  SizedBox(height: 15.0,),
        
                  ElevatedButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                 },
                 child: Text('Do not have an account?Create Account',
                 style: TextStyle(fontSize:20,color:  Colors.grey,),
                 ),),
        
                  ],
                 
                ),
                
              ),)
            ],
          ),
        ),
      ),

    );
  }
}