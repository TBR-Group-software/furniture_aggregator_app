import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_icons.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';

class MyLocationButton extends StatelessWidget {
  final Function() _onTap;

  const MyLocationButton({
    required Function() onTap,
    Key? key,
  })  : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppPalette.darkPeach,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppPalette.white,
            width: 2,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.location,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
