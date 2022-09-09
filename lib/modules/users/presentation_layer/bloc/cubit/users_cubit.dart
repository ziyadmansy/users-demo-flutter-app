import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:users_demo_app/modules/users/data_layer/models/user.dart';
import 'package:users_demo_app/modules/users/data_layer/repositories/users_repository.dart';

part 'users_cubit_state.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  final UsersRepository usersRepo;

  UsersCubit(this.usersRepo) : super(UsersCubitInitial());

  List<User> _users = [];
  List<User> _pickedUsers = [];

  List<User> get pickedUsers => _pickedUsers;
  List<User> get users => _users;

  set users(List<User> users) {
    _users = users;
  }

  set pickedUsers(List<User> pickedUsers) {
    _pickedUsers = pickedUsers;
  }

  Future<void> getUsersData({int count = 1}) async {
    try {
      _users = await usersRepo.getUsersData(count: count);
      emit(UsersLoadSuccessState());
    } catch (e) {
      emit(UsersLoadFailState());
    }
  }

  void filterPickedUsers() {
    _pickedUsers = _users.where((user) => user.isUserPicked).toList();
  }
}
