import '../models/expense.dart';

abstract class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;
  AddExpenseEvent(this.expense);
}

class RemoveExpenseEvent extends ExpenseEvent {
  final Expense expense;
  RemoveExpenseEvent(this.expense);
}
