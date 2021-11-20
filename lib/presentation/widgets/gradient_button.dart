import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget _child;
  final double? _height;
  final double? _width;
  final LinearGradient _gradient;
  final BorderRadius _borderRadius;
  final Function()? _onTap;

  const GradientButton({
    required Widget child,
    required LinearGradient gradient,
    double? height,
    double? width,
    BorderRadius? borderRadius,
    Function()? onTap,
    Key? key,
  })  : _child = child,
        _height = height,
        _width = width,
        _gradient = gradient,
        _borderRadius = borderRadius ?? BorderRadius.zero,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: _gradient,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: _borderRadius,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: _onTap,
          child: _child,
        ),
      ),
    );
  }
}
