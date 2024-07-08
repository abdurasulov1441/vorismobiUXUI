import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Shartnomalar extends StatelessWidget {
  const Shartnomalar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MiniRedAppBar(), ContractsPage()],
      ),
    );
  }
}

List<Contract> contracts = [
  Contract(
      type: 'Technical service',
      number: '#13548',
      dueDate: '01.08.2024',
      amount: 2581669.00,
      isActive: true),
  Contract(
      type: 'Annual services',
      number: '#17758',
      dueDate: '01.08.2024',
      amount: 2751120.00,
      isActive: false),
  Contract(
      type: 'Technical service',
      number: '#35684',
      dueDate: '01.08.2024',
      amount: 58120.00,
      isActive: true),
];

class Contract {
  final String type;
  final String number;
  final String dueDate;
  final double amount;
  final bool isActive;

  Contract(
      {required this.type,
      required this.number,
      required this.dueDate,
      required this.amount,
      required this.isActive});
}

class ContractsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: contracts.length,
          itemBuilder: (context, index) {
            final contract = contracts[index];
            return Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: AppColors.lightIconGuardColor, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                  title: Text(
                    contract.type,
                  ),
                  onTap: () {
                    pushScreen(context, screen: Shartnoma());
                  },
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Contract ${contract.number}'),
                      Text('Due: ${contract.dueDate}'),
                      Text('${contract.amount.toStringAsFixed(2)} so\'m'),
                    ],
                  ),
                  trailing: contract.isActive
                      ? ElevatedButton(
                          onPressed: () => null,
                          child: Text('Aktiv',
                              style: TextStyle(color: Colors.green)))
                      : ElevatedButton(
                          onPressed: () => null,
                          child: Text('Bekor qilingan',
                              style: TextStyle(color: Colors.red)))),
            );
          },
        ),
      ),
    );
  }
}

class Shartnoma extends StatelessWidget {
  const Shartnoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
