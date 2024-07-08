import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Shartnomalar extends StatelessWidget {
  const Shartnomalar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
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
                    pushScreen(context,
                        screen: Shartnoma(
                          shartnomaNumber: index.toString(),
                        ));
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
                          onPressed: () {},
                          child: const Text('Aktiv',
                              style: TextStyle(color: Colors.green)))
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text('Bekor qilingan',
                              style: TextStyle(color: Colors.red)))),
            );
          },
        ),
      ),
    );
  }
}

class Shartnoma extends StatelessWidget {
  const Shartnoma({super.key, required this.shartnomaNumber});
  final String shartnomaNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MiniRedAppBar(),
          MiniRedTitle(title: 'Shartnoma №$shartnomaNumber'),
          const SizedBox(
            height: 10,
          ),
          FirestForShartnoma(),
          const TableForShartnoma(),
          SizedBox(
            height: 5,
          ),
          AdressData(),
          ContainerWithData(),
          IconWithText(),
          FinalDataShartnoma(),
        ],
      ),
    );
  }
}

class TableForShartnoma extends StatelessWidget {
  const TableForShartnoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1),
        children: [
          TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Ish kunlari', textAlign: TextAlign.center),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Shanba va Yakshanba',
                    textAlign: TextAlign.center),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child:
                    const Text('Bayram kunlari', textAlign: TextAlign.center),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: Colors.red),
                    SizedBox(width: 4),
                    Text('08:00 - 17:00'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('-:-', textAlign: TextAlign.center),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: Colors.red),
                    SizedBox(width: 4),
                    Text('01:00 - 07:00'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              'assets/images/elektrik.svg',
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Elektriklar xizmati:',
                  style: AppStyle.fontStyle.copyWith(fontSize: 12),
                ),
                Text(
                  '63 498 s\'om oyiga',
                  style: AppStyle.fontStyle.copyWith(
                      color: AppColors.lightIconGuardColor, fontSize: 12),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              'assets/images/simkarta.svg',
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Uzmobile: 6 310 s\'om oyiga',
                  style: AppStyle.fontStyle.copyWith(
                      color: AppColors.lightIconGuardColor, fontSize: 12),
                ),
                Text(
                  'UMS: 8 421 so\'m oyiga',
                  style: AppStyle.fontStyle.copyWith(
                      color: AppColors.lightIconGuardColor, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              'assets/images/tolov_jadvali.svg',
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('To\'lov jadvali:'),
                Text(
                  '2 581 669 so\'m oyiga',
                  style: AppStyle.fontStyle.copyWith(
                      color: AppColors.lightIconGuardColor, fontSize: 12),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ContainerWithData extends StatelessWidget {
  const ContainerWithData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1. Qo\'riqlovdagi joy: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                'Qurol xonasi',
                style: AppStyle.fontStyle.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Karta raqami: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '508 387',
                style: AppStyle.fontStyle.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 soat uchun: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '9 120 ',
                style: AppStyle.fontStyle.copyWith(),
              ),
              Text(
                'so\'m',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 oy uchun: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '1 668 960 ',
                style: AppStyle.fontStyle.copyWith(),
              ),
              Text(
                'so\'m',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1. Qo\'riqlovdagi joy: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                'Qurol xonasi',
                style: AppStyle.fontStyle.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Karta raqami: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '508 387',
                style: AppStyle.fontStyle.copyWith(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 soat uchun: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '9 120 ',
                style: AppStyle.fontStyle.copyWith(),
              ),
              Text(
                'so\'m',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 oy uchun: ',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
              Text(
                '1 668 960 ',
                style: AppStyle.fontStyle.copyWith(),
              ),
              Text(
                'so\'m',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.lightIconGuardColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AdressData extends StatelessWidget {
  const AdressData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manzil:   ',
              style: AppStyle.fontStyle.copyWith(
                  color: AppColors.lightIconGuardColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'M.Ulug\'bek tumani A.Navoiy MFY Shodlik ko\'chasi 17-uy',
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Obyekt rahbari: ',
              style: AppStyle.fontStyle.copyWith(
                  color: AppColors.lightIconGuardColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: Text(
                'Rahimov Voris Avazbeek o\'g\'li',
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FirestForShartnoma extends StatelessWidget {
  const FirestForShartnoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Aktiv',
              style: AppStyle.fontStyle.copyWith(
                  color: AppColors.lightIconGuardColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download_sharp,
                  color: AppColors.lightIconGuardColor,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Ma\'lumotlar',
              style: AppStyle.fontStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nomi:  ',
              style: AppStyle.fontStyle
                  .copyWith(color: AppColors.lightIconGuardColor),
            ),
            const Text(
              'OOO "MARVEL MACHINERY SYSTEMS"',
              style: AppStyle.fontStyle,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
            child: Table(
                border: TableBorder.all(color: Colors.black, width: 1),
                children: [
              TableRow(children: [
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Qo‘riqlash vaqti:'),
                    ],
                  ),
                )
              ])
            ])),
      ],
    );
  }
}

class FinalDataShartnoma extends StatelessWidget {
  const FinalDataShartnoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Bu oy uchun to\'lov',
                  style: AppStyle.fontStyle,
                ),
                Text(
                  '2 581 669 so\'m',
                  style: AppStyle.fontStyle
                      .copyWith(color: AppColors.lightIconGuardColor),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 30,
              child: VerticalDivider(
                width: 1,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Bu oy uchun to\'lov',
                  style: AppStyle.fontStyle,
                ),
                Text(
                  '2 581 669 so\'m',
                  style: AppStyle.fontStyle
                      .copyWith(color: AppColors.lightIconGuardColor),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        ButtonWithRadius(),
      ],
    );
  }
}
