import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/domain/usecase/nearby_shops.dart';
import 'package:furniture_aggregator_app/presentation/bloc/bloc_status.dart';
import 'package:meta/meta.dart';

part 'nearby_shops_event.dart';
part 'nearby_shops_state.dart';

class NearbyShopsBloc extends Bloc<NearbyShopsEvent, NearbyShopsState> {
  final NearbyShopsUseCase _nearbyShopsUseCase;

  NearbyShopsBloc(this._nearbyShopsUseCase)
      : super(NearbyShopsState(
          status: BlocStatus.loading,
          nearbyShops: <Shop>[],
        )) {
    on<GetNearbyShopsEvent>(_onGetNearbyShopsEvent);
  }

  Future<void> _onGetNearbyShopsEvent(
      GetNearbyShopsEvent event, Emitter<NearbyShopsState> emit) async {
    emit(_onLoading());
    try {
      final List<Shop> nearbyShops = await _nearbyShopsUseCase();
      emit(NearbyShopsState(
        status: BlocStatus.loaded,
        nearbyShops: nearbyShops,
      ));
    } on Exception catch (error) {
      emit(_onError(error));
    }
  }

  NearbyShopsState _onLoading() => NearbyShopsState(
        status: BlocStatus.loading,
        nearbyShops: state.nearbyShops,
        error: state.error,
      );

  NearbyShopsState _onError(Object? error) => NearbyShopsState(
        status: BlocStatus.error,
        nearbyShops: state.nearbyShops,
        error: error,
      );
}
