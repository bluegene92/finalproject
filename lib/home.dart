import 'package:finalproject/widgets/welcome-header.dart';
import 'package:flutter/material.dart';
import 'widgets/financial-card.dart';
import 'widgets/recent-activity-card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double totalHeight = screenHeight + bottomPadding;

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        color: const Color.fromRGBO(229, 239, 237, 1.0),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeHeader(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              FinancialCard(
                title: "Income",
                amount: 0,
                iconData: Icons.ac_unit,
                bgColor: Color.fromRGBO(169, 247, 185, 1),
              ),
              FinancialCard(
                  title: "Expense",
                  amount: 0,
                  iconData: Icons.ac_unit,
                  bgColor: Color.fromRGBO(229, 239, 238, 1)),
            ]),
            RecentActivityCard()
          ],
        ),
      ),
    ));
  }
}
