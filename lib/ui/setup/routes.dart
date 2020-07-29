import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rogchat/app/logger.dart';
import 'package:rogchat/constants/app_routes.dart';
import 'package:rogchat/ui/views/home/home_view.dart';
import 'package:rogchat/ui/views/home/tabs/chat_list/search_view.dart';
import 'package:rogchat/ui/views/login/login_view.dart';

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
      case RoutePaths.Search:
        return CupertinoPageRoute(builder: (_) => SearchView());
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
