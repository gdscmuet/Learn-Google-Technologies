import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/Themes.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  
  const InputField({ Key? key, 
      required this.title,
      required this.hint,
      this.controller,
      this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: InputFieldStyle,),
          Container(
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  autofocus: false,
                  style: InputFieldStyle,
                  controller: controller,
                  cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[600],
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subHeadingStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      )
                    )
                  ),
                )),
                 widget==null?Container():Container(child: widget),
              ],
            ),
          )
        ],
      ),
    );
  }
}