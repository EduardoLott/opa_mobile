

import 'package:flutter/material.dart';

class MenuCardItem extends StatelessWidget{
  final String name;
  final double price;
  final String? description;

  const MenuCardItem({super.key, required this.name,required this.price,this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: Card(
        elevation: 4, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ) ,
        ),
      ),
    );
  }
  
}