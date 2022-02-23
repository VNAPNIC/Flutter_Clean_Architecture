import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mCWhite,
          body: Container(
            margin: EdgeInsets.only(top: 100.h),
            child: Center(
              child: Column(
                children: [
                  if (state is GetSettingSuccess) Text(state.resTest),
                  ElevatedButton(
                    child: const Text('Get setting'),
                    onPressed: () {
                      context.read<HomePageCubit>().getSetting("Thang nguyen ");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
