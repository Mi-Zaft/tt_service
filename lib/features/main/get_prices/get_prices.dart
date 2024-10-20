import 'package:tt_service/models/prices.dart';
import 'package:tt_service/services/api_service.dart';
BagPrices? _cachedBagPrices;
DateTime? _cacheTimestamp;
const Duration _cacheTTL = Duration(minutes: 10);

Future<BagPrices?> fetchBagPrices({bool forceRefresh = false}) async {
  // Если не требуется принудительное обновление и данные есть в кэше
  if (!forceRefresh && _cachedBagPrices != null && _cacheTimestamp != null) {
    final cacheAge = DateTime.now().difference(_cacheTimestamp!);
    if (cacheAge < _cacheTTL) {
      // Возвращаем кэшированные данные
      return _cachedBagPrices;
    }
  }

  // Если данных нет в кэше или они устарели, выполняем сетевой запрос
  final apiService = ApiService();
  final bagPrices = await apiService.fetchPrices();

  if (bagPrices != null) {
    // Обновляем кэш
    _cachedBagPrices = bagPrices;
    _cacheTimestamp = DateTime.now();
  }
  print('fetchBagPrices вызван');
  return bagPrices;
}

void clearBagPricesCache() {
  _cachedBagPrices = null;
  _cacheTimestamp = null;
}