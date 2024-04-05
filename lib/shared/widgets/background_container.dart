import 'package:flutter/material.dart';

class ContainerBackground extends StatelessWidget {
  const ContainerBackground({
    super.key,
    required this.child,
    required this.color,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: color),
      child: child,
    );
  }
}
