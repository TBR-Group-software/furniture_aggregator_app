import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/domain/entity/shop.dart';
import 'package:furniture_aggregator_app/presentation/page/map/widget/map_marker.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';
import 'package:furniture_aggregator_app/utils/map/marker_generator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng _curLocation;
  final List<Shop> _shops;

  const MapWidget({
    required LatLng curLocation,
    required List<Shop> shops,
    Key? key,
  })  : _curLocation = curLocation,
        _shops = shops,
        super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
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

  @override
  void initState() {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _buildMarkers(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: (_) => setState(() => _selectedShop = null),
      compassEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: widget._curLocation,
        zoom: 12,
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
              onTap: () => setState(() => _selectedShop = shop),
            ),
      },
    );
  }
}
