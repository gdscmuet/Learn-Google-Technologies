import 'package:flutter/material.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/view/login_screen.dart';

class Routes{
    static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return _buildRoute( login_screen(), settings);            
   
   
         default:
        return _buildRoute(const Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
