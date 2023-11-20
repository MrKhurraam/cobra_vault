import 'package:flutter/material.dart';
import '../pages/homepage/homepage.dart';
import '../pages/settings/setting_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _createRoute(HomePage());
      case "settings":
        return _createRoute(Settings());
      default:
        return _createRoute(HomePage());
    }
  }

  static Route _createRoute(pagee) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => pagee,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.linear;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
