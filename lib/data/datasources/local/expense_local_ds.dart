import '../../core/constants/hive_boxes.dart';
import '../../core/services/hive_service.dart';
import '../models/expense_model.dart';

class ExpenseLocalDataSource {
  Future<void> addExpense(ExpenseModel expense) async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    await box.put(expense.id, expense.toMap());
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    final expenses = <ExpenseModel>[];
    for (final key in box.keys) {
      final expenseData = box.get(key) as Map<dynamic, dynamic>;
      expenses.add(ExpenseModel.fromMap(Map<String, dynamic>.from(expenseData)));
    }
    return expenses;
  }

  Future<List<ExpenseModel>> getExpensesByMonth(int year, int month) async {
    final allExpenses = await getAllExpenses();
    return allExpenses
        .where((e) => e.date.year == year && e.date.month == month)
        .toList();
  }

  Future<List<ExpenseModel>> getExpensesByCategory(String category) async {
    final allExpenses = await getAllExpenses();
    return allExpenses.where((e) => e.category == category).toList();
  }

  Future<List<ExpenseModel>> getExpensesByAccountId(String accountId) async {
    final allExpenses = await getAllExpenses();
    return allExpenses.where((e) => e.fromAccountId == accountId).toList();
  }

  Future<ExpenseModel?> getExpenseById(String id) async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    final expenseData = box.get(id);
    if (expenseData == null) return null;
    return ExpenseModel.fromMap(Map<String, dynamic>.from(expenseData as Map));
  }

  Future<void> updateExpense(ExpenseModel expense) async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    await box.put(expense.id, expense.toMap());
  }

  Future<void> deleteExpense(String id) async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    await box.delete(id);
  }

  Future<void> clearAllExpenses() async {
    final box = HiveService.getBox(HiveBoxes.expenses);
    await box.clear();
  }
}
