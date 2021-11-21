import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/presentation/bloc/nearby_shops/nearby_shops_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final NearbyShopsBloc _nearbyShopsBloc;

  const MapView({
    required NearbyShopsBloc nearbyShopsBloc,
    Key? key,
  })  : _nearbyShopsBloc = nearbyShopsBloc,
        super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    widget._nearbyShopsBloc.add(GetNearbyShopsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
