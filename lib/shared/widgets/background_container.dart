import 'package:flutter/material.dart';

class ContainerBackground extends StatelessWidget {
  const ContainerBackground({
    super.key,
    required this.child,
    required this.color,
    this.isRequired = false,
  });

  final Widget child;
  final Color color;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: isRequired ? color : null),
      child: child,
    );
  }
}
