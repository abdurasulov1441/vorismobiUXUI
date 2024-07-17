import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

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
        child: const Icon(
          Icons.add,
          color: AppColors.lightHeaderColor,
        ),
      ),
      body: const Column(
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
                  var con;
                  return FlipCard(
                    rotateSide: RotateSide.right,
                    disableSplashEffect: false,
                    splashColor: Colors.orange,
                    onTapFlipping: true,
                    axis: FlipAxis.vertical,
                    controller: con,
                    frontWidget: Center(
                      child: Container(
                        width: 300,
                        height: 200,
                        child: Image.asset(
                          'assets/images/set.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    backWidget: Container(
                        width: 300,
                        height: 200,
                        child: Image.asset(
                          'assets/images/set.png',
                          fit: BoxFit.contain,
                        )),
                  );
                })));
  }
}
