import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/gateway/geolocation/gateway.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/service/geolocation.dart';

class GeolocatorGeolocationService implements GeolocationService {
  final GeolocationGateWay _geolocationGateWay;
  final Factory<Geolocation, GeolocationDto> _geolocationFromDtoFactory;

  GeolocatorGeolocationService(
    this._geolocationGateWay,
    this._geolocationFromDtoFactory,
  );

  @override
  Future<Geolocation> getCurrentLocation() async => _geolocationFromDtoFactory
      .create(await _geolocationGateWay.getCurrentLocation());
}
