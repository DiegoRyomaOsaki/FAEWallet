import 'package:flutter/material.dart';
import 'package:wallet_app/models/contact.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/widgets/contact_card.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> searchList = [];

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Contacts",
                        style: MyTextTheme.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.add_rounded,
                    color: MyColorTheme.black,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: MyColorTheme.black.withValues(alpha: 0.5),
                  ),
                  labelText: 'Enter a name or e-mail',
                ),
                onChanged: (value) {
                  if (value.isEmpty || value == "") {
                    setState(() {
                      isSearching = false;
                      searchList.clear();
                    });
                    return;
                  }

                  searchList.clear();

                  for (var element in allContact) {
                    if (element.name.contains(value) ||
                        element.email.contains(value)) {
                      setState(() {
                        searchList.add(element);
                      });
                    }
                  }

                  setState(() {
                    isSearching = true;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              isSearching && searchList.isEmpty
                  ? const Center(
                      child: Text(
                        "Search is empty",
                        style: MyTextTheme.regular,
                      ),
                    )
                  : Column(
                      children: isSearching
                          ? searchList
                              .map((e) => ContactCard(contact: e))
                              .toList()
                          : allContact
                              .map((e) => ContactCard(contact: e))
                              .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
