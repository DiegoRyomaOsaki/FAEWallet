import 'package:flutter/material.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 144,
              width: double.infinity,
              color: MyColorTheme.medievalRed,
              child: const Center(
                child: Text(
                  "Habilidades",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
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
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: MyColorTheme.medievalRed,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nivel del personaje",
                              style: TextStyle(
                                color: MyColorTheme.black.withValues(alpha: 0.5),
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              "LVL 2",
                              style: MyTextTheme.bold,
                            ),
                          ],
                        ),                        
                      ],
                    ),                    
                  ),
                                    
                  const SizedBox(height: 32),
                  Text(
                    "Atributos",
                    style: TextStyle(
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _SkillCard(skill: {
                              'name': 'Fuerza',
                              'cost': 10,
                              'currency': 'Skols',
                            }),
                            const SizedBox(height: 16),
                            _SkillCard(skill: {
                              'name': 'Magia',
                              'cost': 10,
                              'currency': 'Skols',
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            _SkillCard(skill: {
                              'name': 'Resistencia',
                              'cost': 12,
                              'currency': 'Skols',
                            }),
                            const SizedBox(height: 16),
                            _SkillCard(skill: {
                              'name': 'Inteligencia',
                              'cost': 12,
                              'currency': 'Skols',
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Habilidades aprendidas",
                    style: TextStyle(
                      color: MyColorTheme.black.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _SpellsCard(
                    name: "Hoja de fuego",
                    description: "En una mano libre evocas un haz ardiente del tamaño y forma de una cimitarra que dura mientras lo haga el conjuro. Si lo sueltas, desaparece, pero puedes volver a evocarlo como acción adicional.",
                    icon: Icons.healing_rounded,
                  ),
                  _SpellsCard(
                    name: "Rayo de luna",
                    description: "Un rayo plateado de luz pálida brilla en un cilindro de 5 pies de radio y 40 pies de alto, cuyo centro se encuentra en un punto que elijas dentro del alcance. Hasta que el conjuro termine, una luz tenue llena el cilindro.",
                    icon: Icons.pets_rounded,
                  ),
                  _SpellsCard(
                    name: "Visión en la oscuridad",
                    description: "Tocas a una criatura voluntaria para concederle la capacidad de ver en la oscuridad. Mientras dura el conjuro, la criatura tiene visión en la oscuridad hasta una distancia de 60 pies.",
                    icon: Icons.transform_rounded,
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

class _SpellsCard extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;

  const _SpellsCard({
    required this.name,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(  // Añadimos el widget Material aquí
        color: Colors.white,
        elevation: 4,
        shadowColor: MyColorTheme.shadow,
        borderRadius: BorderRadius.circular(20.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: MyColorTheme.gray,
            child: Icon(
              icon,
              color: MyColorTheme.black,
            ),
          ),
          title: Text(name),
          subtitle: Text(
            description,
            style: TextStyle(
              color: MyColorTheme.black.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Map<String, dynamic> skill;
  
  const _SkillCard({required this.skill});

  IconData _getIconForSkill(String name) {
    switch (name) {
      case 'Fuerza':
        return Icons.fitness_center;
      case 'Resistencia':
        return Icons.shield;
      case 'Magia':
        return Icons.auto_fix_high;
      case 'Inteligencia':
        return Icons.psychology;
      default:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126, // Aumentado de 120 a 126 para dar más espacio
      width: 126,
      padding: const EdgeInsets.all(16.0),
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
        mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
        children: [
          Icon(
            _getIconForSkill(skill['name']),
            color: MyColorTheme.medievalRed,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            skill['name'],
            style: MyTextTheme.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            skill['cost'].toString(),
            style: MyTextTheme.regular,
          ),
        ],
      ),
    );
  }
}

