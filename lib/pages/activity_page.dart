import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/models/activity.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/widgets/activity_list.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Actividad",
            style: TextStyle(color: MyColorTheme.black),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.keyboard_backspace_rounded,
              color: MyColorTheme.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_search.svg'),
              color: MyColorTheme.black,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Container(
                color: MyColorTheme.gray,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: MyColorTheme.medievalRed,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  unselectedLabelColor: MyColorTheme.black.withValues(
                    alpha: 0.5,
                  ),
                  tabs: const [
                    Tab(text: 'Todos'),
                    Tab(text: 'Ingresos'),
                    Tab(text: 'Gastos'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActivityList(
                        listActivity: allActivity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActivityList(
                        listActivity: allActivity
                            .where((element) => element.isIncome)
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActivityList(
                        listActivity: allActivity
                            .where((element) => !element.isIncome)
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
