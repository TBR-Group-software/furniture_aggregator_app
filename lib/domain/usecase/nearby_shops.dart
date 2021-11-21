import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/domain/service/nearby_shops.dart';

abstract class NearbyShopsUseCase {
  Future<List<Shop>> call();
}

class RestNearbyShopsUseCase implements NearbyShopsUseCase {
  final NearbyShopsService _service;

  RestNearbyShopsUseCase(this._service);

  @override
  Future<List<Shop>> call() => _service.getNearbyShops();
}
