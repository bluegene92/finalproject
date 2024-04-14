import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Day",
              style: TextStyle(
                  fontSize: 48, height: 0.8, fontWeight: FontWeight.bold)),
          Text("Dat Tran", style: TextStyle(fontSize: 24))
        ],
      ),
    );
  }
}
