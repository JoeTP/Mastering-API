part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class GetAllUsersState extends AppState {
  final List<User> allUsersList;
  GetAllUsersState(this.allUsersList);
}

class GetUserDetailsState extends AppState {
  final User userObject;
  GetUserDetailsState(this.userObject);
}

class CreateNewUserState extends AppState {
  final User userObject;
  CreateNewUserState(this.userObject);
}

class DeleteUserState extends AppState {
  final dynamic data ;
  DeleteUserState(this.data);
}