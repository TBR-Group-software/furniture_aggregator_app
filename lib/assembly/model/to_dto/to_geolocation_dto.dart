import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';

class GeolocationToDtoFactory implements Factory<GeolocationDto, Geolocation> {
  @override
  GeolocationDto create(Geolocation arg) => GeolocationDto(
        longitude: arg.longitude,
        latitude: arg.latitude,
      );
}
