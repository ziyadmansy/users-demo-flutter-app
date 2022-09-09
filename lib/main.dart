import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_demo_app/modules/users/data_layer/data_sources/users_service.dart';
import 'package:users_demo_app/modules/users/data_layer/repositories/users_repository.dart';
import 'package:users_demo_app/modules/users/presentation_layer/bloc/cubit/users_cubit.dart';
import 'package:users_demo_app/modules/users/presentation_layer/pages/users_page.dart';

import 'core/app_routes.dart';
import 'core/constants.dart';

void main() {
  // Run the Main App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(UsersRepository(UsersService())),
      child: MaterialApp(
        title: APP_NAME,
        home: const UsersPage(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
