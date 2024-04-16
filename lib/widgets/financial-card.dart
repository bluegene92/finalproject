import 'package:flutter/material.dart';

class FinancialCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData iconData;
  final Color bgColor;

  const FinancialCard(
      {Key? key,
      required this.title,
      required this.amount,
      required this.iconData,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 190,
        height: 190,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: Colors.black87, width: 3.0),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black87, width: 2.0)),
                  child: Center(child: Icon(iconData)),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('$title',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                Text('\$$amount',
                    style: const TextStyle(fontSize: 24, color: Colors.black87))
              ])
            ])
          ]),
        ));
  }
}
