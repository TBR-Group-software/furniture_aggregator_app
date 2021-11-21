import 'package:furniture_aggregator_app/assembly/entity/from_geolocation_dto.dart';
import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/gateway/geolocation/gateway.dart';
import 'package:furniture_aggregator_app/data/gateway/geolocation/geolocator.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/service/geolocator_geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/service/geolocation.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void init() {
  //Geolocation flow
  sl.registerLazySingleton<Factory<Geolocation, GeolocationDto>>(
      () => GeolocationFromDto());
  sl.registerLazySingleton<GeolocationGateWay>(
      () => GeolocatorGeolocationGateWay());
  sl.registerLazySingleton<GeolocationService>(
      () => GeolocatorGeolocationService(sl.get(), sl.get()));
}
