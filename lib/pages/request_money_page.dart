import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'package:wallet_app/widgets/number_icon.dart';

class RequestMoneyPage extends StatefulWidget {
  const RequestMoneyPage({super.key});

  @override
  State<RequestMoneyPage> createState() => _RequestMoneyPageState();
}

class _RequestMoneyPageState extends State<RequestMoneyPage> {
  final TextEditingController _txtMoney = TextEditingController();
  final TextEditingController oldValue = TextEditingController();

  @override
  void initState() {
    _txtMoney.addListener(() {
      if (_txtMoney.text.isEmpty) {
        _txtMoney.value.copyWith(text: '');
        return;
      } else if (_txtMoney.text.compareTo(oldValue.text) != 0) {
        NumberFormat f = NumberFormat("#,###");
        final number = _txtMoney.text.contains('.')
            ? _txtMoney.text
            : int.parse(
                _txtMoney.text.replaceAll(',', ''),
              );
        String newString =
            _txtMoney.text.contains('.') ? number.toString() : f.format(number);
        _txtMoney.value = TextEditingValue(
          text: newString,
        );
        return;
      } else {
        return;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _txtMoney.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Solicitar Dinero",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildToContact(),
              const SizedBox(height: 32.0),
              TextFormField(
                maxLength: 10,
                cursorHeight: 56,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.attach_money_rounded,
                    color: MyColorTheme.black,
                    size: 56,
                  ),
                  counterText: '',
                ),
                style: const TextStyle(
                  fontSize: 40,
                  color: MyColorTheme.black,
                  fontWeight: FontWeight.w600,
                ),
                controller: _txtMoney,
                autofocus: true,
                readOnly: true,
              ),
              const SizedBox(height: 32.0),
              buildCalculator(),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Solicitar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildToContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: MyColorTheme.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: MyColorTheme.gray,
              width: 2,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundColor: MyColorTheme.gray,
              child: Text(
                "A",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: MyColorTheme.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Para:",
              style: TextStyle(
                fontSize: 12,
                color: MyColorTheme.black.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              "Ana Nielsen",
              style: MyTextTheme.regular,
            ),
            Text(
              "nielsen.ann@gmail.com",
              style: TextStyle(
                fontSize: 12,
                color: MyColorTheme.black.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCalculator() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 32.0,
      spacing: 32.0,
      runAlignment: WrapAlignment.center,
      children: [
        for (int i = 1; i < 10; ++i)
          NumberIcon(
            onTap: () {
              String oldText = _txtMoney.text;
              String newText = "$oldText$i";

              setState(() {
                oldValue.value = _txtMoney.value;
                _txtMoney.text = newText;
              });
            },
            child: Text(
              "$i",
              style: const TextStyle(
                fontSize: 24,
                color: MyColorTheme.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        NumberIcon(
          onTap: () {
            String oldText = _txtMoney.text;
            String newText = "${oldText}0";

            setState(() {
              oldValue.value = _txtMoney.value;
              _txtMoney.text = newText;
            });
          },
          child: const Text(
            "0",
            style: TextStyle(
              fontSize: 24,
              color: MyColorTheme.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        NumberIcon(
          onTap: () {
            String oldText = _txtMoney.text;
            String newText = _txtMoney.text == "" ? "0." : "$oldText.";

            if (newText.contains('..')) return;

            setState(() {
              oldValue.value = _txtMoney.value;
              _txtMoney.text = newText;
            });
          },
          child: const Text(
            ".",
            style: TextStyle(
              fontSize: 24,
              color: MyColorTheme.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        NumberIcon(
          onTap: () {
            setState(() {
              if (_txtMoney.text != "" && _txtMoney.text.isNotEmpty) {
                oldValue.value = _txtMoney.value;
                _txtMoney.text =
                    _txtMoney.text.substring(0, _txtMoney.text.length - 1);
              }
            });
          },
          child: const Icon(
            Icons.backspace_outlined,
            color: MyColorTheme.black,
          ),
        ),
      ],
    );
  }
}
