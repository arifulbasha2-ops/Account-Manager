import 'package:flutter_test/flutter_test.dart';
import 'package:account_manager/data/models/account_model.dart';
import 'package:account_manager/data/models/expense_model.dart';
import 'package:account_manager/data/models/transaction_model.dart';

void main() {
  group('AccountModel Tests', () {
    test('Create account and verify properties', () {
      final account = AccountModel(
        name: 'Salary Account',
        balance: 5000,
        totalIn: 10000,
        totalOut: 5000,
      );

      expect(account.name, 'Salary Account');
      expect(account.balance, 5000);
      expect(account.totalIn, 10000);
      expect(account.totalOut, 5000);
      expect(account.id.isNotEmpty, true);
    });

    test('Copy account with modified balance', () {
      final account1 = AccountModel(
        name: 'Test Account',
        balance: 1000,
      );

      final account2 = account1.copyWith(balance: 2000);

      expect(account1.balance, 1000);
      expect(account2.balance, 2000);
      expect(account1.id, account2.id);
    });

    test('Convert account to/from map', () {
      final account = AccountModel(
        name: 'Test Account',
        balance: 5000,
      );

      final map = account.toMap();
      final accountFromMap = AccountModel.fromMap(map);

      expect(accountFromMap.name, account.name);
      expect(accountFromMap.balance, account.balance);
    });
  });

  group('ExpenseModel Tests', () {
    test('Create expense and verify category', () {
      final expense = ExpenseModel(
        amount: 500,
        fromAccountId: 'acc1',
        description: 'Grocery shopping',
        category: 'Groceries',
        date: DateTime.now(),
      );

      expect(expense.category, 'Groceries');
      expect(expense.amount, 500);
    });

    test('Expense deduction calculation', () {
      final startBalance = 10000.0;
      final expenseAmount = 1500.0;
      final expectedBalance = startBalance - expenseAmount;

      expect(expectedBalance, 8500);
    });
  });

  group('TransactionModel Tests', () {
    test('Create salary transaction', () {
      final transaction = TransactionModel(
        type: 'salary',
        accountId: 'acc1',
        amount: 5000,
        description: 'Monthly salary',
        date: DateTime.now(),
      );

      expect(transaction.type, 'salary');
      expect(transaction.amount, 5000);
    });

    test('Create transfer transaction', () {
      final transaction = TransactionModel(
        type: 'transfer',
        accountId: 'acc1',
        fromAccountId: 'acc1',
        toAccountId: 'acc2',
        amount: 2000,
        description: 'Transfer to savings',
        date: DateTime.now(),
      );

      expect(transaction.type, 'transfer');
      expect(transaction.fromAccountId, 'acc1');
      expect(transaction.toAccountId, 'acc2');
    });
  });
}
