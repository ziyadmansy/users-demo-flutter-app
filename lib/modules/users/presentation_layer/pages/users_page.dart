import 'package:badges/badges.dart';
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
    getUsersData();
  }

  Future<void> getUsersData() async {
    await context.read<UsersCubit>().getUsersData();
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(ERROR_MESSAGE),
                  SizedBox(
                    height: 16,
                  ),
                  SharedWidgets.buildTextButton(
                    btnText: 'Retry',
                    onPress: getUsersData,
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            child: Column(
              children: [
                // Picked Users List
                SizedBox(
                  height: 80,
                  child: usersCubitData.filterPickedUsers().isEmpty
                      ? Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.sensor_occupied_rounded,
                            ),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: usersCubitData.filterPickedUsers().length,
                          itemBuilder: (context, i) {
                            final pickedUserData =
                                usersCubitData.filterPickedUsers()[i];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Badge(
                                    badgeColor: Colors.white,
                                    badgeContent: Center(
                                      child: IconButton(
                                        constraints: BoxConstraints(
                                          maxHeight: 16,
                                          maxWidth: 16,
                                        ),
                                        iconSize: 16,
                                        padding: EdgeInsets.all(0.0),
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            pickedUserData.isUserPicked = false;
                                          });
                                        },
                                      ),
                                    ),
                                    toAnimate: false,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        pickedUserData.image ??
                                            imagePlaceHolderError,
                                      ),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                      '${pickedUserData.firstName} ${pickedUserData.lastName}'),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                SharedWidgets.buildClickableTextForm(
                  hint: 'Search by player name',
                  prefixIcon: Icon(Icons.search),
                  onChanged: (text) {
                    usersCubitData.filterSearchedUsers(text);
                  },
                ),
                SharedWidgets.build16HeightSizedBox(),
                // All Users List
                Expanded(
                  child: ListView.builder(
                    itemCount: usersCubitData.filteredSearchUsers.length,
                    itemBuilder: (context, i) {
                      final userData = usersCubitData.filteredSearchUsers[i];
                      return ListTile(
                        title:
                            Text('${userData.firstName} ${userData.lastName}'),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            userData.image ?? imagePlaceHolderError,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        trailing: SharedWidgets.buildRoundedElevatedButton(
                          btnText: userData.isUserPicked ? 'Remove' : 'Add',
                          btnColor:
                              userData.isUserPicked ? Colors.red : Colors.blue,
                          onPress: () {
                            setState(() {
                              userData.isUserPicked = !userData.isUserPicked;
                            });
                          },
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
