import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            // title: item.buildTitle(context),
            // subtitle: item.buildSubtitle(context),
            title: Text(
              'Item title',
              style: AppStyle.fontStyle,
            ),
            subtitle: Text(
              'Item Sub title',
              style: AppStyle.fontStyle,
            ),
            onTap: () {},
            //leading: Image.asset(images[index],width: 50,height: 50,),
            textColor: AppColors.textColor,
            trailing: const Icon(
              Icons.arrow_right,
              color: AppColors.iconColor,
              weight: 20,
            ),
          );
        },
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Homadse Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hoasdme Page'),
      ),
    );
  }
}
