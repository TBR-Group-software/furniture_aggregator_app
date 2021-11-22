import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/presentation/bloc/bloc_status.dart';
import 'package:furniture_aggregator_app/presentation/bloc/geolocation/geolocation_bloc.dart';
import 'package:furniture_aggregator_app/presentation/page/map/widget/map_marker.dart';
import 'package:furniture_aggregator_app/presentation/page/map/widget/my_location_button.dart';
import 'package:furniture_aggregator_app/presentation/page/map/widget/products_bottom_sheet.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';
import 'package:furniture_aggregator_app/utils/map/marker_generator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng _curLocation;
  final List<Shop> _shops;
  final GeolocationBloc _geolocationBloc;

  const MapWidget({
    required LatLng curLocation,
    required List<Shop> shops,
    required GeolocationBloc geolocationBloc,
    Key? key,
  })  : _curLocation = curLocation,
        _shops = shops,
        _geolocationBloc = geolocationBloc,
        super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  BitmapDescriptor? _unselectedMarker;
  BitmapDescriptor? _selectedMarker;
  Shop? _selectedShop;

  void _buildMarkers(BuildContext context) {
    final MarkerGenerator generator = MarkerGenerator(
      const <Widget>[
        MapMarker(color: AppPalette.red),
        MapMarker(color: AppPalette.lightOrange),
      ],
      (List<Uint8List> images) {
        setState(() {
          _selectedMarker = BitmapDescriptor.fromBytes(images.first);
          _unselectedMarker = BitmapDescriptor.fromBytes(images.last);
        });
      },
    );
    generator.generate(context);
  }

  Future<void> _animateToGeolocation(Geolocation geolocation) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(
        LatLng(geolocation.latitude, geolocation.longitude)));
  }

  void _geolocationBlocListener(
      BuildContext context, GeolocationState geolocationState) {
    if (geolocationState.status == BlocStatus.loaded &&
        geolocationState.geolocation != null) {
      _animateToGeolocation(geolocationState.geolocation!);
    }
  }

  void _animateToCurrentGeolocation() =>
      widget._geolocationBloc.add(GetCurrentGeolocationEvent());

  void _onMarkerTap(Shop shop) {
    setState(() => _selectedShop = shop);
    showBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ProductsBottomSheet(
          shop: shop,
        );
      },
    ).closed.then((_) {
      if (_selectedShop == shop && mounted) {
        setState(() => _selectedShop = null);
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _buildMarkers(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeolocationBloc, GeolocationState>(
      bloc: widget._geolocationBloc,
      listener: _geolocationBlocListener,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            initialCameraPosition: CameraPosition(
              target: widget._curLocation,
              zoom: 13,
            ),
            markers: <Marker>{
              if (_unselectedMarker != null && _selectedMarker != null)
                for (final Shop shop in widget._shops)
                  Marker(
                    markerId: MarkerId(shop.id),
                    position: LatLng(
                      shop.geolocation.latitude,
                      shop.geolocation.longitude,
                    ),
                    icon: _selectedShop?.id == shop.id
                        ? _selectedMarker!
                        : _unselectedMarker!,
                    onTap: () => _onMarkerTap(shop),
                  ),
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 48, right: 15),
              child: MyLocationButton(
                onTap: _animateToCurrentGeolocation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
