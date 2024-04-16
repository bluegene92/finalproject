import 'package:flutter/material.dart';

class WeeklyNavigationBar extends StatelessWidget {
  final VoidCallback previousWeek;
  final VoidCallback nextWeek;

  const WeeklyNavigationBar(
      {super.key, required this.previousWeek, required this.nextWeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: BottomAppBar(
          color: const Color.fromARGB(255, 183, 237, 183),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: previousWeek,
                ),
              ),
              IconButton(
                  icon: const Icon(Icons.arrow_right), onPressed: nextWeek)
            ],
          )),
    );
  }
}
