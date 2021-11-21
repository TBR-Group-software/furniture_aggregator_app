import 'dart:async';

import 'package:furniture_aggregator_app/data/gateway/geolocation/gateway.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorGeolocationGateWay implements GeolocationGateWay {
  static final GeolocationDto _paris = GeolocationDto(
    latitude: 48.864716,
    longitude: 2.349014,
  );

  @override
  Future<GeolocationDto> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return GeolocationDto(
          longitude: position.longitude, latitude: position.latitude);
    } on TimeoutException catch (_) {
      return _paris;
    } on PermissionDeniedException catch (_) {
      return _paris;
    } on LocationServiceDisabledException catch (_) {
      return _paris;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
