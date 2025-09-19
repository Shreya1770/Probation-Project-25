import 'package:flutter/material.dart';


import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      // ignore: deprecated_member_use
      backgroundColor:Theme.of(context).colorScheme.background,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
          //drawer header logo
          DrawerHeader(
            child:Center(
            child: Icon(
              Icons.shopping_bag,
          size: 72,
          color:Theme.of(context).colorScheme.inversePrimary,
          ),
          ),
          ),
          const SizedBox(height:25),

          //shop tile
          MyListTile(
          text:"shop",
          icon:Icons.home,
          onTap:()=>Navigator.pop(context),
          
          ),
          

          //cart tile
          MyListTile(
          text:"cart",
          icon:Icons.shopping_cart,
          onTap:(){
            Navigator.pop(context);

            Navigator.pushNamed(context,'/cart_page');
          },
          
          ),
          ],
          ),


          //exit shop tile
          Padding(padding: const EdgeInsets.only(bottom:25.0),
          
         child: MyListTile(
          text:"exit",
          icon:Icons.logout,
          onTap:(){},
          
          ),
          ),
  ],
    ),
    );
  }
    

        
}