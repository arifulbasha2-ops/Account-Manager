import '../datasources/local/transaction_local_ds.dart';
import '../models/transaction_model.dart';

class TransactionRepository {
  final TransactionLocalDataSource _localDataSource;

  TransactionRepository(this._localDataSource);

  Future<void> addTransaction(TransactionModel transaction) {
    return _localDataSource.addTransaction(transaction);
  }

  Future<List<TransactionModel>> getAllTransactions() {
    return _localDataSource.getAllTransactions();
  }

  Future<List<TransactionModel>> getTransactionsByAccountId(String accountId) {
    return _localDataSource.getTransactionsByAccountId(accountId);
  }

  Future<List<TransactionModel>> getTransactionsByMonth(int year, int month) {
    return _localDataSource.getTransactionsByMonth(year, month);
  }

  Future<TransactionModel?> getTransactionById(String id) {
    return _localDataSource.getTransactionById(id);
  }

  Future<void> updateTransaction(TransactionModel transaction) {
    return _localDataSource.updateTransaction(transaction);
  }

  Future<void> deleteTransaction(String id) {
    return _localDataSource.deleteTransaction(id);
  }

  Future<void> clearAllTransactions() {
    return _localDataSource.clearAllTransactions();
  }
}
