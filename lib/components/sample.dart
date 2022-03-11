import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class Sample extends StatelessWidget {
  const Sample(
      {Key? key,
      required this.title,
      required this.amount,
      required this.interest,
      required this.startCurrency,
      required this.endCurrency,
      required this.updateTextFields,
      required this.month})
      : super(key: key);
  final String title;
  final double amount;
  final double interest;
  final double startCurrency;
  final double endCurrency;
  final int month;
  final Function updateTextFields;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setAllValues(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).backgroundColor,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        width: 350,
        height: 275,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRenderer(
                      child: Text(
                    'Hesap Açılış Tutarı:',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    amount.toStringAsFixed(2) + " ₺",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRenderer(
                      child: Text(
                    'Vade Süresi:',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    month.toString() + " ay",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRenderer(
                      child: Text(
                    'Yıllık Faiz/Katılım Oranı %:',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    interest.toStringAsFixed(2) + " %",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRenderer(
                      child: Text(
                    'Vade Başlangıç Kuru',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    startCurrency.toStringAsFixed(2) + " ₺",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRenderer(
                      child: Text(
                    'Vade Bitiş Kuru',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    endCurrency.toStringAsFixed(2) + " ₺",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  setAllValues(BuildContext context) {
    context.read<Calculator>().setAmount(amount);
    context.read<Calculator>().setInterest(interest);
    context.read<Calculator>().setStartCurrency(startCurrency);
    context.read<Calculator>().setEndCurrency(endCurrency);
    context.read<Calculator>().setMonth(month);
    updateTextFields();
  }
}
