import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodorderingapp/Models/category.dart';



List<CategoryItem> categoriesList = [
  CategoryItem(name: "Burger", image: "images/burger.jpg"),
   CategoryItem(name: "SandWich", image: "images/SandWich.jpg"),
  CategoryItem(name: "Steak", image: "images/Steak.jpg"),
  CategoryItem(name: "SandWich", image: "images/SandWich.jpg"),
   CategoryItem(name: "Ice Cream", image: "images/Icecream.jpg"),
   CategoryItem(name: "Burger", image: "images/burger.jpg"),
   CategoryItem(name: "Ice Cream", image: "images/Icecream.jpg"),
];

Widget categories() {
  return Container(
      height: 95,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (BuildContext,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.red.shade100,
                          offset: Offset(4, 6),
                          blurRadius: 20)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        categoriesList[index].image,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    categoriesList[index].name,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            );
          }));
}




