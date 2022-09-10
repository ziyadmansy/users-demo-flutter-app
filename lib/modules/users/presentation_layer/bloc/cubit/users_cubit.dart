import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:users_demo_app/modules/users/data_layer/models/user.dart';
import 'package:users_demo_app/modules/users/data_layer/repositories/users_repository.dart';

part 'users_cubit_state.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  final UsersRepository usersRepo;

  UsersCubit(this.usersRepo) : super(UsersCubitInitial());

  List<User> _users = [];
  List<User> _filteredSearchUsers = [];

  List<User> get filteredSearchUsers => _filteredSearchUsers;

  set filteredSearchUsers(List<User> filteredSearchUsers) {
    _filteredSearchUsers = filteredSearchUsers;
  }
  // List<User> _pickedUsers = [];

  // List<User> get pickedUsers => _pickedUsers;
  List<User> get users => _users;

  set users(List<User> users) {
    _users = users;
  }

  // set pickedUsers(List<User> pickedUsers) {
  //   _pickedUsers = pickedUsers;
  // }

  Future<void> getUsersData({int count = 10}) async {
    try {
      Map<String, dynamic> decodedResponse =
          await usersRepo.getUsersData(count: count);
      _users = (decodedResponse['users'] as List)
          .map((user) => User.fromJson(user))
          .toList();
      _filteredSearchUsers = _users;
      emit(UsersLoadSuccessState());
    } catch (e) {
      print(e);
      emit(UsersLoadFailState());
    }
  }

  List<User> filterPickedUsers() {
    return _users.where((user) => user.isUserPicked).toList();
  }

  void filterSearchedUsers(String searchQuery) {
    if (searchQuery.isEmpty) {
      _filteredSearchUsers = _users;
    } else {
      _filteredSearchUsers = _users
          .where(
            (user) =>
                (user.firstName!
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase())) ||
                (user.lastName!
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase())),
          )
          .toList();
    }
    emit(UsersSearchQueryFinished());
  }
}
