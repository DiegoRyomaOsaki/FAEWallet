import 'package:flutter/material.dart';

import 'package:wallet_app/models/contact.dart';
import 'package:wallet_app/themes/color_theme.dart';

class ContactCard extends StatefulWidget {
  final Contact contact;
  const ContactCard({super.key, required this.contact});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
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
            child: Text(
              widget.contact.name[0],
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: MyColorTheme.black,
              ),
            ),
          ),
          title: Text(widget.contact.name),
          subtitle: Text(
            widget.contact.email,
          ),
        ),
      ),
    );
  }
}
