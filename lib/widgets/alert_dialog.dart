import 'package:api_mastering/widgets/select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../models/user.dart';

class AddNewUserDialog extends StatelessWidget {
  AddNewUserDialog({super.key});

  var userName = TextEditingController();
  var userEmail = TextEditingController();
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add new user'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              BlocProvider.of<AppCubit>(context).createNewUserToRepo(
                  User(
                      name: userName.text,
                      email: userEmail.text,
                      gender: 'Male',
                      status: 'active'),
                  context);
            },
            child: Text('Add')),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userName,
              decoration: InputDecoration(hintText: 'Full Name'),
              autofocus: true,
            ),
            SizedBox(height: 8),
            TextField(
              controller: userEmail,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 8),
            MySelectBox()
          ],
        ),
      ),
    );
  }
}
