

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
      height: 90,
      child: Card(
        elevation: 4, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/productitem100x100.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 250,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'R\$$price' ,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: 250, 
                    child: Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ) ,
        ),
      ),
    );
  }
  
}