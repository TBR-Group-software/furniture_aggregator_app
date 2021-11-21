import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/service/geolocation.dart';

abstract class GetCurrentGeolocationUseCase {
  Future<Geolocation> call();
}

class GeolocatorGetCurrentGeolocationUseCase
    implements GetCurrentGeolocationUseCase {
  final GeolocationService _service;

  GeolocatorGetCurrentGeolocationUseCase(this._service);

  @override
  Future<Geolocation> call() => _service.getCurrentLocation();
}
