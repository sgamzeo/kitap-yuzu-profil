import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  final ColorFilter? colorFilter;

  const CustomIconButton({
    super.key,
    required this.assetPath,
    required this.onTap,
    this.size,
    this.color,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            colorFilter:
                colorFilter ??
                (color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null),
          ),
        ),
      ),
    );
  }
}
