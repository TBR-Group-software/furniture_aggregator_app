import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';

class GeolocationFromDto extends Factory<Geolocation, GeolocationDto> {
  @override
  Geolocation create(GeolocationDto arg) => Geolocation(
        longitude: arg.longitude,
        latitude: arg.latitude,
      );
}
