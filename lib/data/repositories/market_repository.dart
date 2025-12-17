import '../datasources/local/market_local_ds.dart';
import '../models/market_item_model.dart';

class MarketRepository {
  final MarketLocalDataSource _localDataSource;

  MarketRepository(this._localDataSource);

  Future<void> addMarketItem(MarketItemModel item) {
    return _localDataSource.addMarketItem(item);
  }

  Future<List<MarketItemModel>> getAllMarketItems() {
    return _localDataSource.getAllMarketItems();
  }

  Future<List<MarketItemModel>> getMarketItemsByMonth(int year, int month) {
    return _localDataSource.getMarketItemsByMonth(year, month);
  }

  Future<List<MarketItemModel>> getMarketItemsByAccountId(String accountId) {
    return _localDataSource.getMarketItemsByAccountId(accountId);
  }

  Future<MarketItemModel?> getMarketItemById(String id) {
    return _localDataSource.getMarketItemById(id);
  }

  Future<void> updateMarketItem(MarketItemModel item) {
    return _localDataSource.updateMarketItem(item);
  }

  Future<void> deleteMarketItem(String id) {
    return _localDataSource.deleteMarketItem(id);
  }

  Future<void> clearAllMarketItems() {
    return _localDataSource.clearAllMarketItems();
  }
}
