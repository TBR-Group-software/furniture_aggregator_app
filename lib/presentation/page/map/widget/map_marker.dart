import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_text_styles.dart';

class MapMarker extends StatelessWidget {
  final Color _color;

  const MapMarker({
    required Color color,
    Key? key,
  })  : _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppPalette.white,
          width: 2,
        ),
      ),
      child: const Center(
        child: Text(
          '%',
          style: AppTextStyles.montserratWhite2W700NormalS16,
        ),
      ),
    );
  }
}
