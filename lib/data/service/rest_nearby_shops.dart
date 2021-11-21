import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/gateway/nearby_shops/gateway.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/domain/service/geolocation.dart';
import 'package:furniture_aggregator_app/domain/service/nearby_shops.dart';

class RestNearbyShopsService implements NearbyShopsService {
  final NearbyShopsGateWay _nearbyShopsGateWay;
  final GeolocationService _geolocationService;
  final Factory<Shop, ShopDto> _shopFromDtoFactory;
  final Factory<GeolocationDto, Geolocation> _geolocationToDtoFactory;

  RestNearbyShopsService(
    this._nearbyShopsGateWay,
    this._geolocationService,
    this._shopFromDtoFactory,
    this._geolocationToDtoFactory,
  );

  @override
  Future<List<Shop>> getNearbyShops() async => _nearbyShopsGateWay
      .getNearbyShops(_geolocationToDtoFactory
          .create(await _geolocationService.getCurrentLocation()))
      .then((List<ShopDto> shops) => shops
          .map((ShopDto shopDto) => _shopFromDtoFactory.create(shopDto))
          .toList());
}
