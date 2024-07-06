import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';

class Shartnomalar extends StatelessWidget {
  const Shartnomalar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          MiniRedAppBar(),
        ],
      ),
    );
  }
}
