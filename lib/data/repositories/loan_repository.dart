import '../datasources/local/loan_local_ds.dart';
import '../models/loan_model.dart';

class LoanRepository {
  final LoanLocalDataSource _localDataSource;

  LoanRepository(this._localDataSource);

  Future<void> addLoan(LoanModel loan) {
    return _localDataSource.addLoan(loan);
  }

  Future<List<LoanModel>> getAllLoans() {
    return _localDataSource.getAllLoans();
  }

  Future<LoanModel?> getLoanById(String id) {
    return _localDataSource.getLoanById(id);
  }

  Future<void> updateLoan(LoanModel loan) {
    return _localDataSource.updateLoan(loan);
  }

  Future<void> deleteLoan(String id) {
    return _localDataSource.deleteLoan(id);
  }

  Future<void> clearAllLoans() {
    return _localDataSource.clearAllLoans();
  }
}
