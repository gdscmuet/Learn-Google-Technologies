import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends GetWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.mediaQuery.padding.top),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: TextField(
          cursorColor: Colors.green,
          cursorHeight: 20,
          decoration: InputDecoration(
            filled: true,
            fillColor: secondaryColor.withOpacity(0.8),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.green,
            focusColor: Colors.green,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
