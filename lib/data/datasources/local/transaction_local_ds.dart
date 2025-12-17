import '../../core/constants/hive_boxes.dart';
import '../../core/services/hive_service.dart';
import '../models/transaction_model.dart';

class TransactionLocalDataSource {
  Future<void> addTransaction(TransactionModel transaction) async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    await box.put(transaction.id, transaction.toMap());
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    final transactions = <TransactionModel>[];
    for (final key in box.keys) {
      final transactionData = box.get(key) as Map<dynamic, dynamic>;
      transactions.add(TransactionModel.fromMap(Map<String, dynamic>.from(transactionData)));
    }
    return transactions;
  }

  Future<List<TransactionModel>> getTransactionsByAccountId(String accountId) async {
    final allTransactions = await getAllTransactions();
    return allTransactions
        .where((t) => t.accountId == accountId || t.fromAccountId == accountId || t.toAccountId == accountId)
        .toList();
  }

  Future<List<TransactionModel>> getTransactionsByMonth(int year, int month) async {
    final allTransactions = await getAllTransactions();
    return allTransactions
        .where((t) => t.date.year == year && t.date.month == month)
        .toList();
  }

  Future<TransactionModel?> getTransactionById(String id) async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    final transactionData = box.get(id);
    if (transactionData == null) return null;
    return TransactionModel.fromMap(Map<String, dynamic>.from(transactionData as Map));
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    await box.put(transaction.id, transaction.toMap());
  }

  Future<void> deleteTransaction(String id) async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    await box.delete(id);
  }

  Future<void> clearAllTransactions() async {
    final box = HiveService.getBox(HiveBoxes.transactions);
    await box.clear();
  }
}
