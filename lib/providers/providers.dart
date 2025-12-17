import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../core/constants/hive_boxes.dart';
import '../data/models/account_model.dart';
import '../data/models/transaction_model.dart';
import '../data/models/market_item_model.dart';
import '../data/models/loan_model.dart';

// ---------------- HIVE BOX PROVIDERS ----------------
final accountBoxProvider = Provider<Box<AccountModel>>((ref) {
  return Hive.box<AccountModel>(HiveBoxes.accounts);
});

final transactionBoxProvider = Provider<Box<TransactionModel>>((ref) {
  return Hive.box<TransactionModel>(HiveBoxes.transactions);
});

final marketBoxProvider = Provider<Box<MarketItemModel>>((ref) {
  return Hive.box<MarketItemModel>(HiveBoxes.marketItems);
});

final loanBoxProvider = Provider<Box<LoanModel>>((ref) {
  return Hive.box<LoanModel>(HiveBoxes.loans);
});

// ---------------- ACCOUNT PROVIDER ----------------
final accountsProvider = StreamProvider<List<AccountModel>>((ref) async* {
  final box = ref.watch(accountBoxProvider);
  yield box.values.toList();
  yield* box.watch().map((_) => box.values.toList());
});

// ---------------- TRANSACTION PROVIDER ----------------
final transactionsProvider = StreamProvider<List<TransactionModel>>((ref) async* {
  final box = ref.watch(transactionBoxProvider);
  yield box.values.toList();
  yield* box.watch().map((_) => box.values.toList());
});

// ---------------- MARKET PROVIDER ----------------
final marketItemsProvider = StreamProvider<List<MarketItemModel>>((ref) async* {
  final box = ref.watch(marketBoxProvider);
  yield box.values.toList();
  yield* box.watch().map((_) => box.values.toList());
});

// ---------------- LOAN PROVIDER ----------------
final loansProvider = StreamProvider<List<LoanModel>>((ref) async* {
  final box = ref.watch(loanBoxProvider);
  yield box.values.toList();
  yield* box.watch().map((_) => box.values.toList());
});

// ---------------- CASH ACCOUNT PROVIDER ----------------
final cashAccountProvider = Provider<AccountModel?>((ref) {
  final accounts = ref.watch(accountsProvider).maybeWhen(
        data: (data) => data,
        orElse: () => [],
  );

  try {
    return accounts.firstWhere((acc) => acc.name.toLowerCase() == 'cash');
  } catch (_) {
    return null;
  }
});

// ---------------- THEME PROVIDER ----------------
final themeModeProvider = StateProvider<bool>((ref) {
  return false; // false = light, true = dark
});
