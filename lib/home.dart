import 'package:finalproject/widgets/welcome-header.dart';
import 'package:flutter/material.dart';
import 'widgets/financial-card.dart';
import 'widgets/recent-activity-card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  double expenseValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 0.9,
                    widthFactor: 0.9, // Adjust this to cover 80% of the screen
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Expense Amount',
                                style: TextStyle(fontSize: 24.0),
                              ),
                              TextField(
                                controller: _controller,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors
                                            .green // Set the background color to blue
                                        ),
                                    onPressed: () {
                                      if (_controller.text.isNotEmpty) {
                                        setState(() {
                                          print(expenseValue);
                                          expenseValue =
                                              double.parse(_controller.text);
                                        });
                                      }

                                      print('close modal');

                                      _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Add')),
                              )
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.plus_one, color: Colors.white),
            backgroundColor: Colors.green,
            shape: CircleBorder()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 48,
          child: BottomAppBar(
              color: const Color.fromRGBO(221, 222, 253, 1.0),
              shape: CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {},
                  )
                ],
              )),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Color.fromRGBO(229, 239, 237, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeHeader(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FinancialCard(
                        title: "Income",
                        amount: 445,
                        iconData: Icons.money_rounded,
                        bgColor: Color.fromRGBO(169, 247, 185, 1),
                      ),
                      FinancialCard(
                          title: "Expense",
                          amount: expenseValue,
                          iconData: Icons.attach_money,
                          bgColor: Color.fromRGBO(229, 239, 238, 1)),
                    ]),
                RecentActivityCard()
              ],
            ),
          ),
        ));
  }
}
