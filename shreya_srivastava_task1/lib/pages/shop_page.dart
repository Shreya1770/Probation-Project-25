import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class ShopPage extends StatelessWidget{
  const ShopPage({super.key});

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
      ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        );


    
  }
}

