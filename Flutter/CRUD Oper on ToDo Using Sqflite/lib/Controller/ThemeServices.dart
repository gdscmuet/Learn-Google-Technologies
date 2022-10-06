import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices{
  final _box=GetStorage();  //used to store data locally in app
  final _key="isDarkMode";

  bool _LoadThemeFromBox()=>_box.read(_key)??false;
  _SaveThemetoBox(bool isDarkMode)=>_box.write(_key, isDarkMode);
  
  ThemeMode get theme=> _LoadThemeFromBox()?ThemeMode.dark:ThemeMode.light;

  void SwitchTheme(){
    Get.changeThemeMode(_LoadThemeFromBox()?ThemeMode.light:ThemeMode.dark);
    _SaveThemetoBox(!_LoadThemeFromBox());
  }
}