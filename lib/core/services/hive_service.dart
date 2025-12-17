import 'package:hive_flutter/hive_flutter.dart';
import '../constants/hive_boxes.dart';
import '../../data/models/adapters.dart';
import '../../data/models/account_model.dart';
import '../../data/models/transaction_model.dart';
import '../../data/models/market_item_model.dart';
import '../../data/models/loan_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register manual adapters (safe to register even without codegen)
    Hive.registerAdapter(AccountModelAdapter());
    Hive.registerAdapter(TransactionTypeAdapter());
    Hive.registerAdapter(TransactionModelAdapter());
    Hive.registerAdapter(MarketItemModelAdapter());
    Hive.registerAdapter(LoanModelAdapter());

    // Open typed boxes
    await Hive.openBox<AccountModel>(HiveBoxes.accounts);
    await Hive.openBox<TransactionModel>(HiveBoxes.transactions);
    await Hive.openBox<dynamic>(HiveBoxes.expenses);
    await Hive.openBox<MarketItemModel>(HiveBoxes.marketItems);
    await Hive.openBox<LoanModel>(HiveBoxes.loans);
    await Hive.openBox<dynamic>(HiveBoxes.loanPersons);
    await Hive.openBox<dynamic>(HiveBoxes.settings);
  }
  
  static Box<dynamic> getBox(String boxName) {
    return Hive.box<dynamic>(boxName);
  }
  
  static Future<void> closeAllBoxes() async {
    await Hive.close();
  }
  
  static Future<void> clearAllBoxes() async {
    for (final box in Hive.boxes.values) {
      await box.clear();
    }
  }
}
