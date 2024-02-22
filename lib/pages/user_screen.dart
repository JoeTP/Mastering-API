import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/models/user.dart';
import 'package:api_mastering/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  UserScreen({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User user = User();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).getUserByIdFromRepo(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is GetUserDetailsState) {
          user = state.userObject;
          return Scaffold(
            appBar: AppBar(
                title: Text("User Number ${user.id!}"),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).getAllUsersFromRepo();
                    Navigator.pop(context);
                  },
                )),
            body: Center(
              child: Container(
                color: (user.status == 'active') ? Colors.green : Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitleText("User Name: " + user.name!),
                    DetailsText("User Email: " + user.email!),
                    DetailsText("User Gender: " + user.gender!),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
