import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/home_route.dart';
import 'package:flutter_architecture/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print('listener $state');
          if (state is CompletedLoginState) {
            Navigator.pushNamed(context, HomeRoute.id,
                arguments: state.response);
          }
        },
        buildWhen: (previous, current) => current is LoginInitial,
        builder: (context, state) {
          return Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  context
                      .bloc<LoginBloc>()
                      .add(LoginFormEvent(user: 'VMO', password: 'VMO'));
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
