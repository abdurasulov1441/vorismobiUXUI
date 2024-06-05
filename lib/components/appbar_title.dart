import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_style.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/set.png',
                width: 50,
                height: 50,
              )
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'O\'zbekiston Respublikasi',
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Milliy Gvardiyasi Qo\'riqlash Xizmati',
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
