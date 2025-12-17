import '../datasources/local/account_local_ds.dart';
import '../models/account_model.dart';

class AccountRepository {
  final AccountLocalDataSource _localDataSource;

  AccountRepository(this._localDataSource);

  Future<void> addAccount(AccountModel account) {
    return _localDataSource.addAccount(account);
  }

  Future<List<AccountModel>> getAllAccounts() {
    return _localDataSource.getAllAccounts();
  }

  Future<AccountModel?> getAccountById(String id) {
    return _localDataSource.getAccountById(id);
  }

  Future<void> updateAccount(AccountModel account) {
    return _localDataSource.updateAccount(account);
  }

  Future<void> deleteAccount(String id) {
    return _localDataSource.deleteAccount(id);
  }

  Future<void> clearAllAccounts() {
    return _localDataSource.clearAllAccounts();
  }
}
