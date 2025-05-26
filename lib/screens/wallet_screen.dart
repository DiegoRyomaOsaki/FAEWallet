import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/models/bank.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'package:wallet_app/widgets/banking_card.dart';
import 'package:wallet_app/screens/skills_screen.dart';  // Nueva importación

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 204,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 144,
                    width: double.infinity,
                    color: MyColorTheme.medievalRed,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Perfil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 147,
                      width: 147,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/profile_pic.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 140,
                    child: CircleAvatar(
                      backgroundColor: MyColorTheme.medievalRed,
                      child:
                          Icon(Icons.camera_alt_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informacion personal",
                    style: TextStyle(
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Nombre",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "Ryoma",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "E-mail",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "example@gmail.com",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Teléfono",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "+57 315 518 9601",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 32),
                   Text(
                    "Personaje",
                    style: TextStyle(
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Nivel",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "2",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Raza",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "Elfo",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Clase",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "Druida",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text(
                      "Facción",
                      style: MyTextTheme.regular,
                    ),
                    title: const Text(
                      "Neutral",
                      style: MyTextTheme.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Skols y Experiencia",
                        style: TextStyle(
                          color: MyColorTheme.black.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SkillsScreen(),
                          ),
                        ),
                        icon: Icon(
                          Icons.add_rounded,
                          color: MyColorTheme.black.withValues(alpha: 0.5),
                          size: 16,
                        ),
                        label: Text(
                          "Ver Habilidades",
                          style: TextStyle(
                            color: MyColorTheme.black.withValues(alpha: 0.5),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children:
                        myBankingCard.map((e) => BankingCard(bank: e)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
