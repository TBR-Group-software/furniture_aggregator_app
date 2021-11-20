import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_fonts.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';

mixin AppTheme {
  static final ThemeData theme = ThemeData(
    fontFamily: AppFonts.Montserrat,
    primarySwatch: Colors.orange,
    primaryColor: AppPalette.primary,
    scaffoldBackgroundColor: AppPalette.white,
  );
}
