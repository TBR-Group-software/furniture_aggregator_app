import 'package:furniture_aggregator_app/domain/entity/shop.dart';

abstract class NearbyShopsService {
  Future<List<Shop>> getNearbyShops();
}
