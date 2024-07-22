import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';
import 'package:flutter_application_1/screens/Pages_Basic/tarifs_screens/flat/flat_security.dart';
import 'package:flutter_application_1/screens/Pages_Basic/tarifs_screens/object/object_security.dart';

class SendRequestSafingScreen extends StatelessWidget {
  const SendRequestSafingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppbarTitle(),
          ObjectFlatContainer(
            image: 'https://appdata.uz/qbb-data/image.png',
            text: 'Obyektingizni qo\'riqlovga topshiring',
            route: ObjectSecurity(),
          ),
          ObjectFlatContainer(
            image: 'https://appdata.uz/qbb-data/flat.png',
            text: 'Xonadoningizni qo\'riqlovga topshiring',
            route: FlatSecurity(),
          ),
        ],
      ),
    );
  }
}
