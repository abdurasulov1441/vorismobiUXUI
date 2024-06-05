import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_style.dart';

class ListViewForNews extends StatelessWidget {
  const ListViewForNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              // title: item.buildTitle(context),
              // subtitle: item.buildSubtitle(context),
              title: Text(
                'name[index]',
                style: AppStyle.fontStyle,
              ),
              subtitle: Text(
                'secondName[index]',
                style: AppStyle.fontStyle,
              ),
              onTap: () {},
              //leading: Image.asset(images[index],width: 50,height: 50,),
              textColor: Colors.white,
              trailing: Icon(
                Icons.play_arrow,
                color: Colors.black,
                weight: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}
