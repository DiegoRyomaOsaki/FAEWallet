import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wallet_app/models/bank.dart';
import 'package:wallet_app/themes/color_theme.dart';

class BankingCard extends StatefulWidget {
  final Bank bank;
  const BankingCard({super.key, required this.bank});

  @override
  State<BankingCard> createState() => _BankingCardState();
}

class _BankingCardState extends State<BankingCard> {
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
          leading: SizedBox(
            height: double.infinity,
            child: buildIcon(),
          ),
          title: Text(widget.bank.name),
          subtitle: Text(
            widget.bank.no,
          ),
        ),
      ),
    );
  }

  Widget? buildIcon() {
    switch (widget.bank.name) {
      case 'Skols':
        return SvgPicture.asset('assets/icons/ic_visa.svg');

      case 'Experiencia':
        return SvgPicture.asset('assets/icons/ic_master_card.svg');

      default:
        return Text(
          widget.bank.name[0],
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: MyColorTheme.black,
          ),
        );
    }
  }
}
