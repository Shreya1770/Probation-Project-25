import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/view/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email='', password='',name="";
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();

  final _formkey=GlobalKey<FormState>();
  registration() async{
    if(password!= "" && mailcontroller.text!=""){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registered Successfully',style: TextStyle(fontSize: 20.0),)));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      } on FirebaseAuthException catch(e){
        if(e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.orangeAccent,
          content: Text('Password Too Weak',style: TextStyle(fontSize: 20.0),), ));
        }
        else if(e.code=='email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.orangeAccent,content: Text('Account Already Exist', style: TextStyle(fontSize: 20.0),)));
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              
              child: Image.asset(
                'assets/signup.jpg',
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(padding: const EdgeInsets.only(left: 20.0,right: 20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                   SizedBox(height: 10.0,),

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
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      
                      decoration: InputDecoration(
                       hintText: "Name",
                       hintStyle: TextStyle(
                        color: Color(0xFFb2b7bf),
                        fontSize: 18.0
                       )

                      ),
                      
                    ),
                   
                  ),
                  SizedBox(height: 10.0,),

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
                       )

                      ),
                      
                    ),
                   
                  ),
                   SizedBox(height: 10.0,),

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
                      obscureText: true,
                      decoration: InputDecoration(
                       hintText: "Password",
                       hintStyle: TextStyle(
                        color: Color(0xFFb2b7bf),
                        fontSize: 18.0
                       )

                      ),
                      
                    ),
                   
                  ),
                   SizedBox(height: 10.0,),
                   
                    GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email=mailcontroller.text;
                        password=passwordcontroller.text;
                      });
                    }
                    registration();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 24, 97, 156),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.blueAccent, width: 2),
 

                    ),
                    child:Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),
                  ),
                  
                )

                ],
               
              ),
              
            ),)
          ],
        ),
      ),

    );
  }
}