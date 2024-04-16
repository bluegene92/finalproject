import 'package:finalproject/models/expense.dart';
import 'package:bloc/bloc.dart';

class ExpenseCubit extends Cubit<List<Expense>> {
  ExpenseCubit() : super([]);

  void addExpense(Expense expense) {
    emit([...state, expense]);
  }
}
