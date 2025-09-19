import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart'; 

class MyProductTile extends StatelessWidget{

final  Product product;
 const MyProductTile({
  super.key,
  required this.product,
 });

@override
Widget build(BuildContext context){
  return Container(
    child:Column(children: [
      //image

      //name


      //description


      //product price + add to cart 


    ],
    ),
  );
}
}