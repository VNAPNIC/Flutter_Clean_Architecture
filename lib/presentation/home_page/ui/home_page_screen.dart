import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_page_cubit.dart';

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
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  if (state is GetSettingSuccess) Text(state.resTest),
                  if (state is GetSettingError) const Text('error', style: TextStyle(color: Colors.red),),
                  ElevatedButton(
                    child: const Text('Get setting'),
                    onPressed: () {
                      context.read<HomePageCubit>().getSetting("Clean Architecture");
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
