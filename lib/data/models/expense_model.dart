import 'package:uuid/uuid.dart';

class ExpenseModel {
  final String id;
  final double amount;
  final String fromAccountId;
  final String description;
  final String category;
  final DateTime date;
  final DateTime createdAt;

  ExpenseModel({
    String? id,
    required this.amount,
    required this.fromAccountId,
    required this.description,
    required this.category,
    required this.date,
    DateTime? createdAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  ExpenseModel copyWith({
    String? id,
    double? amount,
    String? fromAccountId,
    String? description,
    String? category,
    DateTime? date,
    DateTime? createdAt,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      description: description ?? this.description,
      category: category ?? this.category,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'fromAccountId': fromAccountId,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as String,
      amount: (map['amount'] as num).toDouble(),
      fromAccountId: map['fromAccountId'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      date: DateTime.parse(map['date'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  @override
  String toString() {
    return 'ExpenseModel(id: $id, amount: $amount, category: $category, date: $date)';
  }
}
