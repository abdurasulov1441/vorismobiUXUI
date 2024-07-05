import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';

class MiniRedAppBar extends StatelessWidget {
  const MiniRedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightIconGuardColor,
      width: double.infinity,
      height: 30,
      child: Card(
        elevation: 10,
        color: Colors.transparent,
      ),
    );
  }
}
