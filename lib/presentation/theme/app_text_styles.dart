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

  static const TextStyle montserratWhiteW600NormalS16 = TextStyle(
    fontFamily: AppFonts.Montserrat,
    color: AppPalette.white,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );

  static const TextStyle montserratWhite2W700NormalS16 = TextStyle(
    fontFamily: AppFonts.Montserrat,
    color: AppPalette.white2,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );
}