import '../../core/constants/hive_boxes.dart';
import '../../core/services/hive_service.dart';
import '../models/market_item_model.dart';

class MarketLocalDataSource {
  Future<void> addMarketItem(MarketItemModel item) async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    await box.put(item.id, item.toMap());
  }

  Future<List<MarketItemModel>> getAllMarketItems() async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    final items = <MarketItemModel>[];
    for (final key in box.keys) {
      final itemData = box.get(key) as Map<dynamic, dynamic>;
      items.add(MarketItemModel.fromMap(Map<String, dynamic>.from(itemData)));
    }
    // Sort by dateTime descending
    items.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return items;
  }

  Future<List<MarketItemModel>> getMarketItemsByMonth(int year, int month) async {
    final allItems = await getAllMarketItems();
    return allItems
        .where((item) => item.dateTime.year == year && item.dateTime.month == month)
        .toList();
  }

  Future<List<MarketItemModel>> getMarketItemsByAccountId(String accountId) async {
    final allItems = await getAllMarketItems();
    return allItems.where((item) => item.accountId == accountId).toList();
  }

  Future<MarketItemModel?> getMarketItemById(String id) async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    final itemData = box.get(id);
    if (itemData == null) return null;
    return MarketItemModel.fromMap(Map<String, dynamic>.from(itemData as Map));
  }

  Future<void> updateMarketItem(MarketItemModel item) async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    await box.put(item.id, item.toMap());
  }

  Future<void> deleteMarketItem(String id) async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    await box.delete(id);
  }

  Future<void> clearAllMarketItems() async {
    final box = HiveService.getBox(HiveBoxes.marketItems);
    await box.clear();
  }
}
