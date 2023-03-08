import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  String username;
  UserDetailsScreen({required this.username});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.username)),
    );
  }
}
