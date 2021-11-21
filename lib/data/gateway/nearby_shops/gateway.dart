import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';

abstract class NearbyShopsGateWay {
  Future<List<ShopDto>> getNearbyShops(GeolocationDto geolocationDto);
}