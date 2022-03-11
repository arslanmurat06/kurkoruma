import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<Calculator>().calculateInterest();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Hesapla',
          style: TextStyle(fontSize: 25),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    );
  }
}
