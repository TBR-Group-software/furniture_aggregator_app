import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/presentation/bloc/bloc_status.dart';
import 'package:furniture_aggregator_app/presentation/bloc/geolocation/geolocation_bloc.dart';
import 'package:furniture_aggregator_app/presentation/bloc/nearby_shops/nearby_shops_bloc.dart';
import 'package:furniture_aggregator_app/presentation/page/map/widget/map_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final NearbyShopsBloc _nearbyShopsBloc;
  final GeolocationBloc _geolocationBloc;

  const MapView({
    required NearbyShopsBloc nearbyShopsBloc,
    required GeolocationBloc geolocationBloc,
    Key? key,
  })  : _nearbyShopsBloc = nearbyShopsBloc,
        _geolocationBloc = geolocationBloc,
        super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    widget._geolocationBloc.add(GetCurrentGeolocationEvent());
    widget._nearbyShopsBloc.add(GetNearbyShopsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeolocationBloc, GeolocationState>(
        bloc: widget._geolocationBloc,
        builder: (_, GeolocationState geolocationState) {
          return BlocBuilder<NearbyShopsBloc, NearbyShopsState>(
            bloc: widget._nearbyShopsBloc,
            builder: (_, NearbyShopsState nearbyShopsState) {
              if (geolocationState.status == BlocStatus.loaded &&
                  geolocationState.geolocation != null &&
                  nearbyShopsState.status == BlocStatus.loaded) {
                final Geolocation curLocation = geolocationState.geolocation!;
                return MapWidget(
                  curLocation: LatLng(
                    curLocation.latitude,
                    curLocation.longitude,
                  ),
                  shops: nearbyShopsState.nearbyShops,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
