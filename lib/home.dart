import 'package:finalproject/widgets/welcome-header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/expense.dart';
import 'services/expense_cubit.dart';
import 'utility/date-helper.dart';
import 'utility/expense-helper.dart';
import 'widgets/financial-card.dart';
import 'widgets/recent-activity-card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  double expenseValue = 0.0;
  late DateTime currentDate = DateTime.now();

  void previousWeek() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 7));
      print(currentDate);
    });
  }

  void nextWeek() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseCubit = BlocProvider.of<ExpenseCubit>(context);
    // expenseCubit.generateRandomData();
    return BlocBuilder<ExpenseCubit, List<Expense>>(
        builder: (context, expenses) {
      DateTime startDate = DateHelper.startWeek(currentDate);
      DateTime endDate = DateHelper.endWeek(currentDate);
      var filteredExpenses =
          ExpenseHelper.filterExpenses(expenses, startDate, endDate);

      double totalExpenses = filteredExpenses.fold(
          0, (previousValue, expense) => previousValue + expense.amount);
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                        initialChildSize: 0.7,
                        minChildSize: 0.5,
                        maxChildSize: 0.8,
                        builder: (context, _scrollController) {
                          return SingleChildScrollView(
                            controller: _scrollController,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Expense Amount',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  TextField(
                                    controller: _expenseController,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                    ),
                                  ),
                                  const SizedBox(height: 32.0),
                                  const Text(
                                    'Description',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  TextField(
                                    controller: _descriptionController,
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
                                          if (_expenseController
                                              .text.isNotEmpty) {
                                            setState(() {
                                              double value = double.parse(
                                                  _expenseController.text);
                                              String description =
                                                  _descriptionController.text;
                                              Expense expense = Expense(
                                                  amount: value,
                                                  date: DateTime.now(),
                                                  description: description);

                                              expenseCubit.addExpense(expense);
                                            });
                                          }

                                          print('close modal');

                                          _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 500),
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
                          );
                        });
                  },
                );
              },
              backgroundColor: Colors.green,
              shape: const CircleBorder(),
              child: const Icon(Icons.plus_one, color: Colors.white)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            height: 58,
            child: BottomAppBar(
                color: const Color.fromRGBO(221, 222, 253, 1.0),
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
                        icon: const Icon(Icons.arrow_right),
                        onPressed: nextWeek)
                  ],
                )),
          ),
          body: Builder(builder: (context) {
            return SafeArea(
              child: Container(
                width: double.infinity,
                color: const Color.fromRGBO(229, 239, 237, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeHeader(date: currentDate),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const FinancialCard(
                            title: "Income",
                            amount: 600,
                            iconData: Icons.account_balance,
                            bgColor: Color.fromRGBO(169, 247, 185, 1),
                          ),
                          FinancialCard(
                              title: "Expense",
                              amount: totalExpenses,
                              iconData: Icons.attach_money,
                              bgColor: const Color.fromRGBO(229, 239, 238, 1)),
                        ]),
                    RecentActivityCard(date: currentDate)
                  ],
                ),
              ),
            );
          }));
    });
  }
}
