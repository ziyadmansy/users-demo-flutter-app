import 'package:flutter/material.dart';
import 'package:users_demo_app/modules/users/presentation_layer/pages/users_page.dart';

class AppRoutes {
  static const String usersPageRoute = '/users';

  static Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
    AppRoutes.usersPageRoute: (BuildContext context) => const UsersPage(),
  };
}
