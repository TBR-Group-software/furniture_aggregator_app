import 'package:furniture_aggregator_app/assembly/entity/from_geolocation_dto.dart';
import 'package:furniture_aggregator_app/assembly/entity/from_product_dto.dart';
import 'package:furniture_aggregator_app/assembly/entity/shop_from_dto.dart';
import 'package:furniture_aggregator_app/assembly/factory.dart';
import 'package:furniture_aggregator_app/assembly/model/to_dto/to_geolocation_dto.dart';
import 'package:furniture_aggregator_app/data/gateway/geolocation/gateway.dart';
import 'package:furniture_aggregator_app/data/gateway/geolocation/geolocator.dart';
import 'package:furniture_aggregator_app/data/gateway/nearby_shops/gateway.dart';
import 'package:furniture_aggregator_app/data/gateway/nearby_shops/mock.dart';
import 'package:furniture_aggregator_app/data/model/geolocation.dart';
import 'package:furniture_aggregator_app/data/model/product.dart';
import 'package:furniture_aggregator_app/data/model/shop.dart';
import 'package:furniture_aggregator_app/data/service/geolocator_geolocation.dart';
import 'package:furniture_aggregator_app/data/service/rest_nearby_shops.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/product.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/domain/service/geolocation.dart';
import 'package:furniture_aggregator_app/domain/service/nearby_shops.dart';
import 'package:furniture_aggregator_app/domain/usecase/nearby_shops.dart';
import 'package:furniture_aggregator_app/presentation/bloc/nearby_shops/nearby_shops_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void init() {
  //Geolocation flow
  sl.registerLazySingleton<Factory<Geolocation, GeolocationDto>>(
      () => GeolocationFromDtoFactory());
  sl.registerLazySingleton<Factory<GeolocationDto, Geolocation>>(
      () => GeolocationToDtoFactory());
  sl.registerLazySingleton<GeolocationGateWay>(
      () => GeolocatorGeolocationGateWay());
  sl.registerLazySingleton<GeolocationService>(
      () => GeolocatorGeolocationService(sl.get(), sl.get()));

  //Nearby shops flow
  sl.registerLazySingleton<Factory<Product, ProductDto>>(
      () => ProductFromDtoFactory());
  sl.registerLazySingleton<Factory<Shop, ShopDto>>(
      () => ShopFromDtoFactory(sl.get(), sl.get()));
  sl.registerLazySingleton<NearbyShopsGateWay>(() => MockNearbyShopsGateWay());
  sl.registerLazySingleton<NearbyShopsService>(
      () => RestNearbyShopsService(sl.get(), sl.get(), sl.get(), sl.get()));
  sl.registerLazySingleton<NearbyShopsUseCase>(
      () => RestNearbyShopsUseCase(sl.get()));
  sl.registerLazySingleton<NearbyShopsBloc>(() => NearbyShopsBloc(sl.get()));
}
