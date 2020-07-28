import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/app/logger.dart';
import 'package:skype_clone/constants/app_routes.dart';
import 'package:skype_clone/ui/views/home_view.dart';
import 'package:skype_clone/ui/views/login_view.dart';

class Routes {
  static final logger = getLogger('Router');

  static Route<dynamic> generateRoute(RouteSettings settings) {
    logger.i(
        'generateRoute | name: ${settings.name} arguments: ${settings.arguments}');

    switch (settings.name) {
      case RoutePaths.Home:
        return CupertinoPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return CupertinoPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}