import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/models/activity.dart';
import 'package:wallet_app/pages/activity_page.dart';
import 'package:wallet_app/pages/request_money_page.dart';
import 'package:wallet_app/pages/send_money_page.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'package:wallet_app/widgets/activity_card.dart';
import 'package:wallet_app/pages/shop_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildBalanceCard(),
            const SizedBox(height: 32.0),
            buildMenuButton(context),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Actividad Reciente",
                        style: MyTextTheme.bold,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ActivityPage(),
                          ),
                        ),
                        child: const Text(
                          "Ver todo",
                          style: MyTextTheme.small,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    children: recentActivity
                        .map(
                          (e) => ActivityCard(activity: e),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBalanceCard() {
    return Container(
      decoration: BoxDecoration(
        color: MyColorTheme.medievalRed,
        boxShadow: [
          BoxShadow(
            color: MyColorTheme.shadow,
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SvgPicture.asset('assets/logo.png'),
                Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    width: 30,
                    height: 30,
                ),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: MyColorTheme.medievalRed,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SvgPicture.asset(
                    'assets/profile_pic.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Hola, Ryoma!",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 32.0),
            Text(
              NumberFormat.simpleCurrency(
                locale: 'en_US',
                decimalDigits: 0,
              ).format(27230.00),
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Tu Balance",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          const SizedBox(width: 32.0),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SendMoneyPage(),
              ),
            ),
            child: Container(
              width: 106,
              decoration: BoxDecoration(
                color: MyColorTheme.medievalRed,
                boxShadow: [
                  BoxShadow(
                    color: MyColorTheme.shadow,
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/ic_send.svg'),
                    const SizedBox(height: 18.0),
                    const Text(
                      "Enviar Skols",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ShopPage(),
              ),
            ),
            child: Container(
              width: 106,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/ic_request.svg'),
                    const SizedBox(height: 18.0),
                    const Text(
                      "Tienda",
                      style: TextStyle(
                        color: MyColorTheme.medievalRed,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          const SizedBox(
            width: 66,
            child: Center(
              child: Icon(
                Icons.more_vert_rounded,
                color: MyColorTheme.black,
              ),
            ),
          ),
          const SizedBox(width: 32.0),
        ],
      ),
    );
  }
}
