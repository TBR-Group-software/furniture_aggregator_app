import 'package:flutter/cupertino.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_fonts.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';

mixin AppTextStyles {
  static const TextStyle montserratDarkW500NormalS18H30 = TextStyle(
    fontFamily: AppFonts.Montserrat,
    color: AppPalette.dark,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 18,
    height: 1.67,
  );

  static const TextStyle montserratWhiteW600NormalS16H30 = TextStyle(
    fontFamily: AppFonts.Montserrat,
    color: AppPalette.white,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 18,
    height: 1.88,
  );
}