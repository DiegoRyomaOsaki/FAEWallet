import 'package:flutter/material.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/widgets/setting_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Configuración",
                  style: TextStyle(
                    color: MyColorTheme.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              SettingCard(
                name: 'Lenguaje',
                icon: Icons.language_outlined,
              ),
              SettingCard(
                name: 'Notificationes',
                icon: Icons.notifications_outlined,
              ),
              SettingCard(
                name: 'Soporte',
                icon: Icons.support_outlined,
              ),
              SettingCard(
                name: 'Acerca de',
                icon: Icons.info_outlined,
              ),
              SettingCard(
                name: 'Logout',
                icon: Icons.logout_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
