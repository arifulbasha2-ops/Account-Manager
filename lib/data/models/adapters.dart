import 'package:hive/hive.dart';

import 'account_model.dart';
import 'transaction_model.dart';
import 'market_item_model.dart';
import 'loan_model.dart';

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final int typeId = 0;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return AccountModel(
      id: fields[0] as String,
      name: fields[1] as String,
      balance: (fields[2] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.name);
    writer.writeByte(2);
    writer.write(obj.balance);
  }
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 4;

  @override
  TransactionType read(BinaryReader reader) {
    final index = reader.readByte();
    return TransactionType.values[index];
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    writer.writeByte(obj.index);
  }
}

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 1;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return TransactionModel(
      id: fields[0] as String,
      type: fields[1] as TransactionType,
      date: DateTime.fromMillisecondsSinceEpoch(fields[2] as int),
      amount: (fields[3] as num).toDouble(),
      fromAccountId: fields[4] as String,
      toAccountId: fields[5] as String?,
      description: fields[6] as String,
      category: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer.writeByte(8);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.type);
    writer.writeByte(2);
    writer.write(obj.date.millisecondsSinceEpoch);
    writer.writeByte(3);
    writer.write(obj.amount);
    writer.writeByte(4);
    writer.write(obj.fromAccountId);
    writer.writeByte(5);
    writer.write(obj.toAccountId);
    writer.writeByte(6);
    writer.write(obj.description);
    writer.writeByte(7);
    writer.write(obj.category);
  }
}

class MarketItemModelAdapter extends TypeAdapter<MarketItemModel> {
  @override
  final int typeId = 2;

  @override
  MarketItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return MarketItemModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: (fields[2] as num).toDouble(),
      dateTime: DateTime.fromMillisecondsSinceEpoch(fields[3] as int),
      accountId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MarketItemModel obj) {
    writer.writeByte(5);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.name);
    writer.writeByte(2);
    writer.write(obj.price);
    writer.writeByte(3);
    writer.write(obj.dateTime.millisecondsSinceEpoch);
    writer.writeByte(4);
    writer.write(obj.accountId);
  }
}

class LoanModelAdapter extends TypeAdapter<LoanModel> {
  @override
  final int typeId = 3;

  @override
  LoanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return LoanModel(
      id: fields[0] as String,
      personName: fields[1] as String,
      amount: (fields[2] as num).toDouble(),
      isGiven: fields[3] as bool,
      accountId: fields[4] as String,
      date: DateTime.fromMillisecondsSinceEpoch(fields[5] as int),
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoanModel obj) {
    writer.writeByte(7);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.personName);
    writer.writeByte(2);
    writer.write(obj.amount);
    writer.writeByte(3);
    writer.write(obj.isGiven);
    writer.writeByte(4);
    writer.write(obj.accountId);
    writer.writeByte(5);
    writer.write(obj.date.millisecondsSinceEpoch);
    writer.writeByte(6);
    writer.write(obj.description);
  }
}
