import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';

class InterestField extends StatefulWidget {
  const InterestField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<InterestField> createState() => _InterestFieldState();
}

class _InterestFieldState extends State<InterestField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: kIsWeb ? 150 : 100,
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            onTextChanged(value, context);
          },
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          cursorColor: Theme.of(context).cursorColor,
          decoration: const InputDecoration(
            labelText: 'Oran %',
            labelStyle: TextStyle(color: Colors.white, fontSize: 9),
            helperText: 'Yıllık Faiz/Katılım % oranını:',
            helperStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      )
    ]);
  }

  void onTextChanged(String value, BuildContext context) {
    double interest = 0;
    if (value.isNotEmpty) {
      interest = double.parse(value);
    }

    context.read<Calculator>().setInterest(interest);
  }
}
