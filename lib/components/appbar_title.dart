import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30,
          color: AppColors.iconGuardColor,
        ),
        Container(
          // color: AppColors.iconGuardColor,
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              Row(
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
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'O\'zbekiston Respublikasi',
                        style: AppStyle.fontStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Milliy Gvardiyasi Qo\'riqlash Xizmati',
                        style: AppStyle.fontStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
