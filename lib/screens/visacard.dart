import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Visacard extends StatelessWidget {
  const Visacard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CreditCardUi(
            cardHolderFullName: 'John Doe',
            cardNumber: '1234567812345678',
            validFrom: '01/23',
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
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const CreditCardUi(
                    cardHolderFullName: 'John Doe',
                    cardNumber: '1234567812345678',
                    validFrom: '01/23',
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
