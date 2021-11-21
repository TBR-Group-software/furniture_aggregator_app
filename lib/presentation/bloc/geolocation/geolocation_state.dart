part of 'geolocation_bloc.dart';

class GeolocationState {
  final BlocStatus status;
  final Geolocation? geolocation;
  final Object? error;

  GeolocationState({
    required this.status,
    this.geolocation,
    this.error,
  });
}
