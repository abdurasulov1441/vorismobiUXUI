import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class ObjectFlatContainerFull extends StatelessWidget {
  const ObjectFlatContainerFull({
    super.key,
    required this.image,
    required this.text,
    required this.route,
  });
  final String image;
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      decoration: const BoxDecoration(
          color: AppColors.lightIconGuardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightBackgroundColor,
            radius: 200, // Radius of the inner circle (avatar)
            backgroundImage: AssetImage(
              image,
            ), // Image for the avatar
          ),
          // Image.asset(
          //   image,

          //   // width: 350,
          //   // height: 250,
          // ),

          // Container(
          //   decoration: const BoxDecoration(
          //       color: AppColors.lightIconGuardColor,
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(15),
          //         bottomRight: Radius.circular(15),
          //       )),
          //   height: 50,
          //   color: AppColors.lightHeaderColor,
          //   child: Text('data'),
          // )
        ],
      ),
    );
  }
}
