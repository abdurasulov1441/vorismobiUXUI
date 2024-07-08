import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: AppColors.lightIconGuardColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColors.lightHeaderColor,
        ),
      ),
      body: Column(
        children: [
          MiniRedAppBar(),
          MiniRedTitle(title: 'Mening kartalarim'),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CardList(),
          ),
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 20,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const CreditCardUi(
                    cardHolderFullName: 'John Doe',
                    cardNumber: '1234567812345678',
                    // validFrom: '01/23',
                    validThru: '01/28',
                    topLeftColor: Colors.blue,
                    doesSupportNfc: true,
                    placeNfcIconAtTheEnd: true,
                    cardType: CardType.debit,
                    cardProviderLogo: FlutterLogo(),
                    cardProviderLogoPosition: CardProviderLogoPosition.right,
                    showBalance: true,
                    balance: 128.32434343,
                    autoHideBalance: true,
                    enableFlipping: false,
                    cvvNumber: '123',
                  );
                })));
  }
}
