import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class ObjectFlatContainer extends StatelessWidget {
  const ObjectFlatContainer({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.iconGuardColor, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 250,
              height: 250,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      '/object_security'); //pushNamed('/object_security');
                },
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.iconGuardColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: AppStyle.fontStyle
                            .copyWith(color: AppColors.backgroundColor),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
