import 'package:finalproject/home.dart';
import 'package:finalproject/services/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ExpenseCubit expenseCubit = ExpenseCubit();
  expenseCubit.generateRandomData();

  runApp(BlocProvider(create: (_) => ExpenseCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Home());
  }
}
