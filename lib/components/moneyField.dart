import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';

class MoneyField extends StatefulWidget {
  const MoneyField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<MoneyField> createState() => _MoneyFieldState();
}

class _MoneyFieldState extends State<MoneyField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("geldi" + Random().nextInt(10000).toString());

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 250,
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            onTextFieldChanged(value, context);
          },
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          cursorColor: Theme.of(context).cursorColor,
          decoration: const InputDecoration(
            labelText: ' ₺ Tutar ',
            labelStyle: TextStyle(color: Colors.white, fontSize: 9),
            helperText: 'Lütfen yatırılacak tutarı giriniz',
            helperStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      )
    ]);
  }

  onTextFieldChanged(String value, BuildContext context) {
    double amount = 0;
    if (value.isNotEmpty) {
      amount = double.parse(value);
    }

    context.read<Calculator>().setAmount(amount);
  }
}
