import 'package:api_mastering/cubit/app_cubit.dart';
import 'package:api_mastering/pages/user_list_screen.dart';
import 'package:api_mastering/repository/my_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'helpers/injection.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>(),
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: Home()),
        ),
      ),
    );
  }
}
