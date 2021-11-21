import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/domain/service/nearby_shops.dart';

abstract class GetNearbyShopsUseCase {
  Future<List<Shop>> call();
}

class RestGetNearbyShopsUseCase implements GetNearbyShopsUseCase {
  final NearbyShopsService _service;

  RestGetNearbyShopsUseCase(this._service);

  @override
  Future<List<Shop>> call() => _service.getNearbyShops();
}
