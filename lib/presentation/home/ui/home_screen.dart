import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/user/model/response/login_response.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponse? response;

  HomeScreen({this.response});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.response?.accessToken ?? ""),
        ),
      ),
    );
  }
}
