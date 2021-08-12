import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';

class HomeScreen extends StatefulWidget {
  final AuthEntity? authEntity;

  HomeScreen({this.authEntity});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.authEntity?.token ?? ""),
        ),
      ),
    );
  }
}
