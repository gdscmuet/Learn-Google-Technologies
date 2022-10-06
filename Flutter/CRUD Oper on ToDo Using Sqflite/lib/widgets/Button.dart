import 'package:flutter/material.dart';
import 'package:to_do/Themes.dart';
class Button extends StatelessWidget {
  final String label;
  final Function()? ontap;
  const Button({ Key? key ,required this.label,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        width: 100,
        height: 50,
        child: Center(child: Text(label,style: TextStyle(color: Colors.white,),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bluish,
        ),
      ),
    );
  }
}

