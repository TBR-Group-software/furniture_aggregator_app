part of 'nearby_shops_bloc.dart';

class NearbyShopsState {
  final BlocStatus status;
  final List<Shop> nearbyShops;
  final Object? error;

  NearbyShopsState({
    required this.status,
    required this.nearbyShops,
    this.error,
  });
}
