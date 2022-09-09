import 'dart:convert';

import 'package:http/http.dart';
import 'package:users_demo_app/core/api_routes.dart';

class UsersService {
  Future<String> getUsers({int count = 1}) async {
    try {
      Response response = await get(
        Uri.parse(ApiRoutes.getUsers(count)),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      print(response.body);
      print(response.statusCode);

      return response.body;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
