import '../../data/models/account_model.dart';
import '../../data/models/transaction_model.dart';

class AccountBalanceService {
  /// Salary / Receive Money
  static void addMoney({
    required AccountModel account,
    required double amount,
  }) {
    account.balance += amount;
    account.save();
  }

  /// Expense Logic (money goes out)
  static void addExpense({
    required AccountModel account,
    required double amount,
  }) {
    if (account.balance < amount) {
      throw Exception('Insufficient balance');
    }
    account.balance -= amount;
    account.save();
  }

  /// Transfer between accounts
  static void transferMoney({
    required AccountModel fromAccount,
    required AccountModel toAccount,
    required double amount,
  }) {
    if (fromAccount.id == toAccount.id) {
      throw Exception('From and To account cannot be same');
    }
    if (fromAccount.balance < amount) {
      throw Exception('Insufficient balance');
    }

    fromAccount.balance -= amount;
    toAccount.balance += amount;

    fromAccount.save();
    toAccount.save();
  }

  /// Withdraw money → moves to Cash account
  static void withdrawToCash({
    required AccountModel fromAccount,
    required AccountModel cashAccount,
    required double amount,
  }) {
    if (fromAccount.balance < amount) {
      throw Exception('Insufficient balance');
    }

    fromAccount.balance -= amount;
    cashAccount.balance += amount;

    fromAccount.save();
    cashAccount.save();
  }

  /// Reverse transaction (for Edit/Delete support)
  static void reverseTransaction({
    required TransactionModel transaction,
    required Map<String, AccountModel> accountMap,
  }) {
    final fromAccount = accountMap[transaction.fromAccountId]!;
    final toAccount = transaction.toAccountId != null
        ? accountMap[transaction.toAccountId!]
        : null;

    switch (transaction.type) {
      case TransactionType.salary:
      case TransactionType.receive:
        fromAccount.balance -= transaction.amount;
        fromAccount.save();
        break;

      case TransactionType.expense:
        fromAccount.balance += transaction.amount;
        fromAccount.save();
        break;

      case TransactionType.transfer:
        fromAccount.balance += transaction.amount;
        toAccount!.balance -= transaction.amount;
        fromAccount.save();
        toAccount.save();
        break;

      case TransactionType.withdraw:
        fromAccount.balance += transaction.amount;
        toAccount!.balance -= transaction.amount; // cash
        fromAccount.save();
        toAccount.save();
        break;
    }
  }
}
