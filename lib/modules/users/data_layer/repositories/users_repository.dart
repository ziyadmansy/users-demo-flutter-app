import 'dart:convert';

import 'package:users_demo_app/modules/users/data_layer/data_sources/users_service.dart';
import 'package:users_demo_app/modules/users/data_layer/models/user.dart';

class UsersRepository {
  final UsersService usersService;

  UsersRepository(this.usersService);

  Future<List<User>> getUsersData({int count = 1}) async {
    try {
      final rawResponse = await usersService.getUsers(count: count);
      final Map<String, dynamic> decodedResponse = json.decode(rawResponse);

      // Returns users array only and abandon unneeded keys
      return decodedResponse['users'];
    } catch (e) {
      rethrow;
    }
  }
}
