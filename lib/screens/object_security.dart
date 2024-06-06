import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class ObjectSecurity extends StatelessWidget {
  const ObjectSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
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
                  'Text saf bolm qoirlqash',
                  style: AppStyle.fontStyle
                      .copyWith(color: AppColors.backgroundColor),
                ),
              )),
        ],
      ),
    );
  }
}
