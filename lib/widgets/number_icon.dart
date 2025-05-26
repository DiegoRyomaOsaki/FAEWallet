import 'package:flutter/material.dart';
import 'package:wallet_app/themes/color_theme.dart';

class NumberIcon extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  const NumberIcon({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: MyColorTheme.shadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onTap: onTap,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
