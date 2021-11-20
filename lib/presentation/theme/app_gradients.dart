import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';

mixin AppGradients {
  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      AppPalette.darkOrange,
      AppPalette.lightOrange,
    ],
  );
}
