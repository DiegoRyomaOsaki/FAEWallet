import 'package:flutter/material.dart';

import 'package:wallet_app/themes/color_theme.dart';

class SettingCard extends StatefulWidget {
  final String name;
  final IconData icon;
  const SettingCard({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: MyColorTheme.shadow,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: MyColorTheme.black,
          ),
          title: Text(widget.name),
          trailing: Icon(
            Icons.navigate_next_rounded,
            color: MyColorTheme.black.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
