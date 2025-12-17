import '../../core/constants/hive_boxes.dart';
import '../../core/services/hive_service.dart';
import '../models/loan_model.dart';

class LoanLocalDataSource {
  Future<void> addLoan(LoanModel loan) async {
    final box = HiveService.getBox(HiveBoxes.loans);
    await box.put(loan.id, loan.toMap());
  }

  Future<List<LoanModel>> getAllLoans() async {
    final box = HiveService.getBox(HiveBoxes.loans);
    final loans = <LoanModel>[];
    for (final key in box.keys) {
      final loanData = box.get(key) as Map<dynamic, dynamic>;
      loans.add(LoanModel.fromMap(Map<String, dynamic>.from(loanData)));
    }
    return loans;
  }

  Future<LoanModel?> getLoanById(String id) async {
    final box = HiveService.getBox(HiveBoxes.loans);
    final loanData = box.get(id);
    if (loanData == null) return null;
    return LoanModel.fromMap(Map<String, dynamic>.from(loanData as Map));
  }

  Future<void> updateLoan(LoanModel loan) async {
    final box = HiveService.getBox(HiveBoxes.loans);
    await box.put(loan.id, loan.toMap());
  }

  Future<void> deleteLoan(String id) async {
    final box = HiveService.getBox(HiveBoxes.loans);
    await box.delete(id);
  }

  Future<void> clearAllLoans() async {
    final box = HiveService.getBox(HiveBoxes.loans);
    await box.clear();
  }
}
