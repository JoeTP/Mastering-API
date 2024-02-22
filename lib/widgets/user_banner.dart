import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/user.dart';
import '../pages/user_screen.dart';
import '../utils/text_style.dart';

class UserBanner extends StatelessWidget {
  UserBanner({
    required this.userList,
    required this.index,
    // required this.userId,
    super.key,
  });

  final List<User> userList;
  final int index;
  // final int userId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(userId: userList[index].id!))),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  right: BorderSide(
                width: 8,
                color: (userList[index].status! == 'active')
                    ? Colors.green
                    : Colors.grey,
              )),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3.w),
                topLeft: Radius.circular(3.w),
              )),
          margin: EdgeInsets.only(left: 2.w),
          padding: EdgeInsets.all(2.w),
          height: 70,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: TitleText(userList[index].name!)),
                  DetailsText(userList[index].gender!)
                ],
              ),
              DetailsText(userList[index].email!),
            ],
          )),
    );
  }
}
