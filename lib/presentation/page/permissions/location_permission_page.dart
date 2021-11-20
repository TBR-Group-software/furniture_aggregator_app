import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_gradients.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_images.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_text_styles.dart';
import 'package:furniture_aggregator_app/presentation/widgets/gradient_button.dart';
import 'package:furniture_aggregator_app/utils/permissions/location.dart';

class LocationPermissionPage extends StatelessWidget {
  final Widget Function() _navigateToWidget;

  const LocationPermissionPage({
    required Widget Function() navigateToWidget,
    Key? key,
  })  : _navigateToWidget = navigateToWidget,
        super(key: key);

  Future<void> _checkLocationPermission(BuildContext context) async {
    final bool locationAccessible = await locationPermission();
    if (locationAccessible) {
      _navigateToWidget();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _navigateToWidget(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 62),
          child: Column(
            children: <Widget>[
              const Spacer(),
              SvgPicture.asset(
                AppImages.locationMap,
              ),
              const SizedBox(
                height: 66,
              ),
              const Text(
                'We\'re requesting permission for your location',
                style: AppTextStyles.montserratDarkW500NormalS18H30,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GradientButton(
                height: 48,
                width: 218,
                gradient: AppGradients.orangeGradient,
                borderRadius: BorderRadius.circular(8.0),
                child: const Text(
                  'Share my location',
                  style: AppTextStyles.montserratWhiteW600NormalS16H30,
                  textAlign: TextAlign.center,
                ),
                onTap: () => _checkLocationPermission(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
