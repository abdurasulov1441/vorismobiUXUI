import 'package:flutter/material.dart';

class UserNull extends StatelessWidget {
  const UserNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      child: Text('user is null'),
    );
  }
}
