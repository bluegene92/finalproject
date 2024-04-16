import 'package:finalproject/models/expense.dart';

class ExpenseHelper {
  static List<Expense> filterExpenses(
      List<Expense> expenses, DateTime startDate, DateTime endDate) {
    return expenses.where((expense) {
      return expense.date.isAfter(startDate) && expense.date.isBefore(endDate);
    }).toList();
  }
}
