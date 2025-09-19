import 'package:flutter/material.dart';

import '../components/my_button.dart';

class Intropage extends StatelessWidget{
  const Intropage({super.key});

  @override
  Widget build(BuildContext context){
    var icon = Icon(Icons.shopping_bag,
          size: 72,
          color:Theme.of(context).colorScheme.inversePrimary,
          );
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.inversePrimary,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Center(child: icon),
          const SizedBox(height:25),


          //title
          Text("Minimal Shop",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          ),


          // subtitle
          Text("Premium Quality Product",
          style:TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          ),
          const SizedBox(height:25),
          

          //button
          MyButton(onTap:()=>Navigator.pushNamed(context, '/shop_page'),
          child: const Icon(Icons.arrow_forward))

        ],
      )
    );
  }
}