import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:provider/provider.dart';

class ObjectSecurity extends StatelessWidget {
  const ObjectSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CounterProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                'Saf Bo\'linmalari Orqali Qo\'riqlash',
                style: AppStyle.fontStyle.copyWith(
                    color: AppColors.iconGuardColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Obyektingizni qo\'riqlovga',
                style: AppStyle.fontStyle.copyWith(
                    fontSize: 25,
                    color: AppColors.iconGuardColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'topshiring',
                style: AppStyle.fontStyle.copyWith(
                    fontSize: 25,
                    color: AppColors.iconGuardColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              model.changeColor1();

              Navigator.pushNamed(context, '/object_security_second_page');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              color: model.backcolor1,
              child: Center(
                heightFactor: 3,
                widthFactor: double.infinity,
                child: Text(
                  'Saf bo\'linmalari orqali qo\'riqlash',
                  style: AppStyle.fontStyle.copyWith(color: model.textColor1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.changeColor2();
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              color: model.backcolor2,
              child: Center(
                heightFactor: 3,
                widthFactor: double.infinity,
                child: Text(
                  'Saf bo\'linmalari orqali qo\'riqlash',
                  style: AppStyle.fontStyle.copyWith(color: model.textColor2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.changeColor3();
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              color: model.backcolor3,
              child: Center(
                heightFactor: 3,
                widthFactor: double.infinity,
                child: Text(
                  'Saf bo\'linmalari orqali qo\'riqlash',
                  style: AppStyle.fontStyle.copyWith(color: model.textColor3),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.changeColor4();
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              color: model.backcolor4,
              child: Center(
                heightFactor: 3,
                widthFactor: double.infinity,
                child: Text(
                  'Saf bo\'linmalari orqali qo\'riqlash',
                  style: AppStyle.fontStyle.copyWith(color: model.textColor4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
