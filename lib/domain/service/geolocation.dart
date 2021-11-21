import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';

abstract class GeolocationService {
  Future<Geolocation> getCurrentLocation();
}
