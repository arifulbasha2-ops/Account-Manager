import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/hive_boxes.dart';
import '../../data/models/account_model.dart';
import '../../data/models/transaction_model.dart';
import 'account_balance_service.dart';

class TransactionService {
  static final _uuid = Uuid();

  static Box<TransactionModel> get _txBox =>
      Hive.box<TransactionModel>(HiveBoxes.transactions);

  // ---------------- SALARY ----------------
  static Future<void> addSalary({
    required AccountModel account,
    required double amount,
    required DateTime date,
    String description = 'Salary',
  }) async {
    AccountBalanceService.addMoney(account: account, amount: amount);

    final tx = TransactionModel(
      id: _uuid.v4(),
      type: TransactionType.salary,
      date: date,
      amount: amount,
      fromAccountId: account.id,
      description: description,
    );

    await _txBox.put(tx.id, tx);
  }

  // ---------------- RECEIVE MONEY ----------------
  static Future<void> receiveMoney({
    required AccountModel account,
    required double amount,
    required DateTime date,
    required String description,
  }) async {
    AccountBalanceService.addMoney(account: account, amount: amount);

    final tx = TransactionModel(
      id: _uuid.v4(),
      type: TransactionType.receive,
      date: date,
      amount: amount,
      fromAccountId: account.id,
      description: description,
    );

    await _txBox.put(tx.id, tx);
  }

  // ---------------- EXPENSE ----------------
  static Future<void> addExpense({
    required AccountModel fromAccount,
    required double amount,
    required DateTime date,
    required String category,
    required String description,
  }) async {
    AccountBalanceService.addExpense(account: fromAccount, amount: amount);

    final tx = TransactionModel(
      id: _uuid.v4(),
      type: TransactionType.expense,
      date: date,
      amount: amount,
      fromAccountId: fromAccount.id,
      description: description,
      category: category,
    );

    await _txBox.put(tx.id, tx);
  }

  // ---------------- TRANSFER ----------------
  static Future<void> transfer({
    required AccountModel fromAccount,
    required AccountModel toAccount,
    required double amount,
    required DateTime date,
    required String description,
  }) async {
    AccountBalanceService.transferMoney(
      fromAccount: fromAccount,
      toAccount: toAccount,
      amount: amount,
    );

    final tx = TransactionModel(
      id: _uuid.v4(),
      type: TransactionType.transfer,
      date: date,
      amount: amount,
      fromAccountId: fromAccount.id,
      toAccountId: toAccount.id,
      description: description,
    );

    await _txBox.put(tx.id, tx);
  }

  // ---------------- WITHDRAW ----------------
  static Future<void> withdraw({
    required AccountModel fromAccount,
    required AccountModel cashAccount,
    required double amount,
    required DateTime date,
    required String description,
  }) async {
    AccountBalanceService.withdrawToCash(
      fromAccount: fromAccount,
      cashAccount: cashAccount,
      amount: amount,
    );

    final tx = TransactionModel(
      id: _uuid.v4(),
      type: TransactionType.withdraw,
      date: date,
      amount: amount,
      fromAccountId: fromAccount.id,
      toAccountId: cashAccount.id,
      description: description,
    );

    await _txBox.put(tx.id, tx);
  }

  // ---------------- DELETE TRANSACTION ----------------
  static Future<void> deleteTransaction({
    required TransactionModel transaction,
    required Map<String, AccountModel> accountMap,
  }) async {
    AccountBalanceService.reverseTransaction(
      transaction: transaction,
      accountMap: accountMap,
    );

    await transaction.delete();
  }
}
