import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:provider/provider.dart';

class ObjectSecuritySecondPage extends StatelessWidget {
  const ObjectSecuritySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CounterProvider>();
    // model.resetColors();
    return Scaffold(
      body: Container(
        child: TextButton(
          child: Text(
            'adwwwwwwwwwwwwwwwwwwwwwwwww',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            model.resetColors();
          },
        ),
      ),
    );
  }
}
