import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utility/date-helper.dart';

class WelcomeHeader extends StatefulWidget {
  final DateTime date;

  const WelcomeHeader({
    super.key,
    required this.date,
  });

  @override
  State<WelcomeHeader> createState() => _WelcomeHeaderState();
}

class _WelcomeHeaderState extends State<WelcomeHeader> {
  late DateTime _currentDate;
  late DateTime startDate = DateTime.now();
  late DateTime endDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _currentDate = widget.date;
    startDate = widget.date;
  }

  @override
  void didUpdateWidget(covariant WelcomeHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.date != oldWidget.date) {
      setState(() {
        _currentDate = widget.date;
        startDate = DateHelper.startWeek(_currentDate);
        endDate = DateHelper.endWeek(_currentDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Expense Tracker",
              style: TextStyle(
                  fontSize: 48, height: 0.9, fontWeight: FontWeight.bold)),
          const Text("Good Morning!", style: TextStyle(fontSize: 24)),
          Text(
              "${DateFormat("MMM dd, yy").format(startDate)} to ${DateFormat("MMM dd, yy").format(endDate)}",
              style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
