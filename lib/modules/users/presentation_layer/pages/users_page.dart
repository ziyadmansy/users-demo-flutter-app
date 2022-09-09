import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_demo_app/core/constants.dart';
import 'package:users_demo_app/core/shared_widgets.dart';
import 'package:users_demo_app/modules/users/presentation_layer/bloc/cubit/users_cubit.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersCubitData = BlocProvider.of<UsersCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Players',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<UsersCubit, UsersCubitState>(
        builder: (context, state) {
          if (state is UsersLoadFailState) {
            return Center(
              child: Text(ERROR_MESSAGE),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                // Picked Users List
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: usersCubitData.pickedUsers.length,
                    itemBuilder: (context, i) {
                      final pickedUserData = usersCubitData.pickedUsers[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Test Account'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SharedWidgets.buildClickableTextForm(
                  hint: 'Search by player name',
                  prefixIcon: Icon(Icons.search),
                ),
                SharedWidgets.build16HeightSizedBox(),

                // All Users List
                Expanded(
                  child: ListView.builder(
                    itemCount: usersCubitData.users.length,
                    itemBuilder: (context, i) {
                      final userData = usersCubitData.users[i];
                      return ListTile(
                        title:
                            Text('${userData.firstName} ${userData.lastName}'),
                        trailing: SharedWidgets.buildRoundedElevatedButton(
                          btnText: 'Add',
                          btnColor: Colors.blue,
                          onPress: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
