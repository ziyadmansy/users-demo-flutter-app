part of 'users_cubit.dart';

@immutable
abstract class UsersCubitState {}

class UsersCubitInitial extends UsersCubitState {}

// Whenever users are loaded successfully
class UsersLoadSuccessState extends UsersCubitState {}

// Whenever users fail to load
class UsersLoadFailState extends UsersCubitState {}

class UsersSearchQueryFinished extends UsersCubitState {}
