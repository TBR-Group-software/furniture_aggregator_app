import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/usecase/geolocation/get_current_geolocation.dart';
import 'package:furniture_aggregator_app/presentation/bloc/bloc_status.dart';
import 'package:meta/meta.dart';

part 'geolocation_event.dart';

part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GetCurrentGeolocationUseCase _getGeolocationUseCase;

  GeolocationBloc(this._getGeolocationUseCase)
      : super(GeolocationState(status: BlocStatus.loading)) {
    on<GetCurrentGeolocationEvent>(_getCurrentGeolocation);
  }

  Future<void> _getCurrentGeolocation(
      GetCurrentGeolocationEvent event, Emitter<GeolocationState> emit) async {
    emit(_onLoading());
    try {
      final Geolocation geolocation = await _getGeolocationUseCase();
      emit(GeolocationState(
        status: BlocStatus.loaded,
        geolocation: geolocation,
      ));
    } on Exception catch (error) {
      emit(_onError(error));
    }
  }

  GeolocationState _onLoading() => GeolocationState(
        status: BlocStatus.loading,
        geolocation: state.geolocation,
        error: state.error,
      );

  GeolocationState _onError(Object? error) => GeolocationState(
        status: BlocStatus.error,
        geolocation: state.geolocation,
        error: error,
      );
}
