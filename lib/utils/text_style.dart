import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class TitleText extends StatelessWidget {
  TitleText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          // fontStyle: FontStyle.italic,
          color: AppColors.subjectTextColor
      ),
    );
  }
}


class DetailsText extends StatelessWidget {
  DetailsText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      style: TextStyle(
          fontSize: 11.sp,
          overflow: TextOverflow.ellipsis,
          color: AppColors.noteTextColor
      ),
    );
  }
}