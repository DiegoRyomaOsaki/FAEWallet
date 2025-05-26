import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/models/activity.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class ActivityCard extends StatefulWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
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
          leading: CircleAvatar(
            backgroundColor: MyColorTheme.gray,
            child: buildIcon(),
          ),
          title: Text(widget.activity.title),
          subtitle: Text(
            timeago.format(widget.activity.createdAt, locale: 'es'),
          ),
          trailing: Text(
            "${widget.activity.isIncome ? "+" : "-"}${NumberFormat.simpleCurrency(
              locale: 'es_ES',
            ).format(widget.activity.total)}",
            style: TextStyle(
              color: widget.activity.isIncome
                  ? MyColorTheme.green
                  : MyColorTheme.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget? buildIcon() {
    switch (widget.activity.title) {
      case 'Google Drive':
        return SvgPicture.asset('assets/icons/ic_g_drive.svg');

      case 'Apple Store':
        return SvgPicture.asset('assets/icons/ic_apple_store.svg');

      case 'Amazon':
        return SvgPicture.asset('assets/icons/ic_amazon.svg');

      case 'Entrega de Pizza':
        return SvgPicture.asset('assets/icons/ic_pizza.svg');



      default:
        return Text(
          widget.activity.title[0],
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: MyColorTheme.black,
          ),
        );
    }
  }
}
