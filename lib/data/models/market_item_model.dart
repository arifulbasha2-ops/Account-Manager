import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'market_item_model.g.dart';

@HiveType(typeId: 2)
class MarketItemModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
  String accountId;

  MarketItemModel({
    String? id,
    required this.name,
    required this.price,
    required this.dateTime,
    required this.accountId,
  }) : id = id ?? const Uuid().v4();
}
