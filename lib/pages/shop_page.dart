import 'package:flutter/material.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tienda de Habilidades",
          style: TextStyle(color: MyColorTheme.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: MyColorTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
          ),
          itemCount: _skillsList.length,
          itemBuilder: (context, index) {
            return _SkillCard(
              skill: _skillsList[index],
            );
          },
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Map<String, dynamic> skill;
  
  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: MyColorTheme.shadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            skill['name'],
            style: MyTextTheme.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                skill['cost'].toString(),
                style: MyTextTheme.regular,
              ),
              const SizedBox(width: 4),
              Text(
                skill['currency'],
                style: MyTextTheme.small,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Comprar"),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> _skillsList = [
  {
    'name': 'Bola de Fuego',
    'cost': 100,
    'currency': 'Skols',
  },
  {
    'name': 'Curar heridas',
    'cost': 150,
    'currency': 'XP',
  },
  {
    'name': 'Invisibilidad',
    'cost': 200,
    'currency': 'Skols',
  },
  {
    'name': 'Detectar Magia',
    'cost': 175,
    'currency': 'XP',
  },
  {
    'name': 'Sueño',
    'cost': 125,
    'currency': 'Skols',
  },
  {
    'name': 'Alterar Recuerdos',
    'cost': 80,
    'currency': 'XP',
  },
];