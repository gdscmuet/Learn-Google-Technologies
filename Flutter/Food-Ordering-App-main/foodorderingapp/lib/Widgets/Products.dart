import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/Models/Products.dart';


List<Product> productList = [  
Product( name: "Burger", image: "images/burger.jpg", rating: 4.2, price: 5, vendor: "GoodFood", whishList: true),
Product(name: "Pizza", image: "images/SandWich.jpg", rating: 4.0, price: 6, vendor: "GoodFood", whishList: false),
Product(name: "Ice Cream", image: "images/Icecream.jpg", rating: 4.2, price: 5, vendor: "GoodFood", whishList: true),
];

Widget Products() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (BuildContext, index) {
            return Container(
              height: 240,
              width: 210,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(4, 6),
                    color: Colors.red.shade100,
                    blurRadius: 4)
              ]),
              child: Column(
                children: [
                  Image.asset(
                    productList[index].image,
                    width: 200,
                    height: 130,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productList[index].name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: 
                        productList[index].whishList ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ) :
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productList[index].rating.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 16,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: 31,
                      ),
                      Text(
                      "\$${productList[index].price}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    ),
  );
}
