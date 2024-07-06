import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';

class SendRequestSafingScreen extends StatelessWidget {
  const SendRequestSafingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Column(
          children: [
            AppbarTitle(),
            ObjectFlatContainer(
              image: 'assets/images/image.png',
              text: 'Obyektingizni qo\'riqlovga topshiring',
              route: '/object_security',
            ),
            ObjectFlatContainer(
              image: 'assets/images/image.png',
              text: 'Xonadoningizni qo\'riqlovga topshiring',
              route: '/object_security',
            ),
          ],
        ),
      ),
    );
  }
}
