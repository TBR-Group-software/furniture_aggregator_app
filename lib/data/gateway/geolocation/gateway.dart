import 'package:furniture_aggregator_app/data/model/geolocation.dart';

abstract class GeolocationGateWay {
  Future<GeolocationDto> getCurrentLocation();
}