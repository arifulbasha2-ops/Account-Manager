import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'account_model.g.dart';

@HiveType(typeId: 0)
class AccountModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double balance;

  AccountModel({
    String? id,
    required this.name,
    this.balance = 0.0,
  }) : id = id ?? const Uuid().v4();

  AccountModel copyWith({
    String? id,
    String? name,
    double? balance,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as String,
      name: map['name'] as String,
      balance: (map['balance'] as num).toDouble(),
    );
  }

  @override
  String toString() => 'AccountModel(id: $id, name: $name, balance: $balance)';
}
