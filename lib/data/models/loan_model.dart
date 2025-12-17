import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'loan_model.g.dart';

@HiveType(typeId: 3)
class LoanModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String personName;

  @HiveField(2)
  double amount;

  @HiveField(3)
  bool isGiven; // true = given, false = taken

  @HiveField(4)
  String accountId;

  @HiveField(5)
  DateTime date;

  @HiveField(6)
  String description;

  LoanModel({
    String? id,
    required this.personName,
    required this.amount,
    required this.isGiven,
    required this.accountId,
    required this.date,
    required this.description,
  }) : id = id ?? const Uuid().v4();
}
