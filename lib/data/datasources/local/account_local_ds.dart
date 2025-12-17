import '../../core/constants/hive_boxes.dart';
import '../../core/services/hive_service.dart';
import '../models/account_model.dart';

class AccountLocalDataSource {
  Future<void> addAccount(AccountModel account) async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    await box.put(account.id, account.toMap());
  }

  Future<List<AccountModel>> getAllAccounts() async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    final accounts = <AccountModel>[];
    for (final key in box.keys) {
      final accountData = box.get(key) as Map<dynamic, dynamic>;
      accounts.add(AccountModel.fromMap(Map<String, dynamic>.from(accountData)));
    }
    return accounts;
  }

  Future<AccountModel?> getAccountById(String id) async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    final accountData = box.get(id);
    if (accountData == null) return null;
    return AccountModel.fromMap(Map<String, dynamic>.from(accountData as Map));
  }

  Future<void> updateAccount(AccountModel account) async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    await box.put(account.id, account.toMap());
  }

  Future<void> deleteAccount(String id) async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    await box.delete(id);
  }

  Future<void> clearAllAccounts() async {
    final box = HiveService.getBox(HiveBoxes.accounts);
    await box.clear();
  }
}
