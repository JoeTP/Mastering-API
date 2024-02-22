import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';
import 'package:bloc/bloc.dart';

import '../repository/my_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final MyRepo myRepo;

  AppCubit(this.myRepo) : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

   List<User> userList = [];

  void getAllUsersFromRepo() {
    myRepo.getAllUsers().then((usersList) => emit(GetAllUsersState(usersList)));
  }

  void getUserByIdFromRepo(int userId) {
    myRepo.geUserById(userId).then((user) => emit(GetUserDetailsState(user)));
  }

  void createNewUserToRepo(User newUser,BuildContext context){
    myRepo.createNewUser(newUser).then((user) {
      userList.add(user);
      emit(CreateNewUserState(user));
      emit(GetAllUsersState(userList));
      Navigator.pop(context);

    });
  }

  void deleteUser(int id, int index){
    myRepo.deleteUser(id).then((data) {
      userList.removeAt(index);
      emit(DeleteUserState(data));
      emit(GetAllUsersState(userList));
    });
  }
}
