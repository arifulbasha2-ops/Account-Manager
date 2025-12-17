import '../datasources/local/expense_local_ds.dart';
import '../models/expense_model.dart';

class ExpenseRepository {
  final ExpenseLocalDataSource _localDataSource;

  ExpenseRepository(this._localDataSource);

  Future<void> addExpense(ExpenseModel expense) {
    return _localDataSource.addExpense(expense);
  }

  Future<List<ExpenseModel>> getAllExpenses() {
    return _localDataSource.getAllExpenses();
  }

  Future<List<ExpenseModel>> getExpensesByMonth(int year, int month) {
    return _localDataSource.getExpensesByMonth(year, month);
  }

  Future<List<ExpenseModel>> getExpensesByCategory(String category) {
    return _localDataSource.getExpensesByCategory(category);
  }

  Future<List<ExpenseModel>> getExpensesByAccountId(String accountId) {
    return _localDataSource.getExpensesByAccountId(accountId);
  }

  Future<ExpenseModel?> getExpenseById(String id) {
    return _localDataSource.getExpenseById(id);
  }

  Future<void> updateExpense(ExpenseModel expense) {
    return _localDataSource.updateExpense(expense);
  }

  Future<void> deleteExpense(String id) {
    return _localDataSource.deleteExpense(id);
  }

  Future<void> clearAllExpenses() {
    return _localDataSource.clearAllExpenses();
  }
}
