import 'package:flutter/material.dart';
import 'package:furniture_aggregator_app/presentation/theme/app_palette.dart';

mixin AppGradients {
  static const LinearGradient orangeLeftToRightGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      AppPalette.darkOrange,
      AppPalette.darkPeach,
    ],
  );

  static const LinearGradient orangeTopToBottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      AppPalette.orange,
      AppPalette.peach,
    ],
  );
}
