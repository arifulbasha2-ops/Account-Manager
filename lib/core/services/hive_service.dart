import 'package:hive_flutter/hive_flutter.dart';
import '../constants/hive_boxes.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // NOTE: After running build_runner and generating adapters you should
    // register adapters here, for example:
    // Hive.registerAdapter(AccountModelAdapter());
    // Hive.registerAdapter(TransactionModelAdapter());
    // Hive.registerAdapter(MarketItemModelAdapter());
    // Hive.registerAdapter(LoanModelAdapter());

    // Open boxes (use typed boxes after registering adapters)
    await Hive.openBox<dynamic>(HiveBoxes.accounts);
    await Hive.openBox<dynamic>(HiveBoxes.transactions);
    await Hive.openBox<dynamic>(HiveBoxes.expenses);
    await Hive.openBox<dynamic>(HiveBoxes.marketItems);
    await Hive.openBox<dynamic>(HiveBoxes.loans);
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
