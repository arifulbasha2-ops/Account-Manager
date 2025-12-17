import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transaction_model.g.dart';

enum TransactionType { salary, receive, expense, transfer, withdraw }

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  TransactionType type;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  double amount;

  @HiveField(4)
  String fromAccountId;

  @HiveField(5)
  String? toAccountId;

  @HiveField(6)
  String description;

  @HiveField(7)
  String? category;

  TransactionModel({
    String? id,
    required this.type,
    required this.date,
    required this.amount,
    required this.fromAccountId,
    this.toAccountId,
    required this.description,
    this.category,
  }) : id = id ?? const Uuid().v4();
}
