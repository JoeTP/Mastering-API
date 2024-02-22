import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/widgets/alert_dialog.dart';
import 'package:api_mastering/widgets/user_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../models/user.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).getAllUsersFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await showDialog(
                    builder: (context) => AddNewUserDialog(),
                    context: context,
                  );
                },
                child: Icon(Icons.add)),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Calling Users From API',
                  style: TextStyle(color: Colors.white)),
            ),
            body: (state is GetAllUsersState)
                ? SingleChildScrollView(
                    child: Column(
                      children: [returnUsers(state, cubit)],
                    ),
                  )
                : Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget returnUsers(GetAllUsersState state, AppCubit cubit) {
    cubit.userList = state.allUsersList;
    return ListView.separated(
      padding: EdgeInsets.only(top: 1.5.h, bottom: 10.h),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Dismissible(
          key: Key(cubit.userList[index].id!.toString()),
          onDismissed: (direction) {
            cubit.deleteUser(cubit.userList[index].id!, index);
          },
          child: UserBanner(userList: cubit.userList, index: index)),
      separatorBuilder: (context, index) => Divider(indent: 10),
      itemCount: cubit.userList.length,
    );
  }
}
