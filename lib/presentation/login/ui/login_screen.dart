import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/home_route.dart';
import 'package:flutter_architecture/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          print('listener $state');
          if (state is LoginSuccessfullyState) {
            HomeRoute.push(context, state.response);
          }
        },
        buildWhen: (previous, current) => current is LoginInitial,
        builder: (context, state) {
          return Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<LoginCubit>()
                      .login(user: 'nankai1421@gmail.com', password: 'Abc@123456');
                },
                child: Text('Login'),
              ),
            ),
          );
        },
      ),
    );
  }
}
