import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';

class Currency extends StatefulWidget {
  const Currency(
      {Key? key,
      required this.title,
      required this.controller,
      required this.isStartCurrency})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final bool isStartCurrency;

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 150,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              controller: widget.controller,
              onChanged: (value) {
                onTextChanged(value, context);
              },
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  void onTextChanged(String value, BuildContext context) {
    double currency = _currencyValidator(value);
    if (widget.isStartCurrency) {
      context.read<Calculator>().setStartCurrency(currency);
    } else {
      context.read<Calculator>().setEndCurrency(currency);
    }
  }

  double _currencyValidator(String value) {
    double currency = 0;
    if (value.isNotEmpty) {
      currency = double.parse(value);
    }

    return currency;
  }
}
