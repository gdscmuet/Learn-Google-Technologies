import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
class utils{
 static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  
  static void flushBarErrorMessage(String message, BuildContext context){

    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve:Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 90, 89, 89),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error , size: 28 , color: Colors.white,),
        )..show(context),

    );

  }
   
  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

}