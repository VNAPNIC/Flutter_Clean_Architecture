import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  if (state is GetSettingSuccess) Text(state.resTest),
                  ElevatedButton(
                    child:  Text(S.current.getSetting),
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
