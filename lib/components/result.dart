import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class Resut extends StatelessWidget {
  const Resut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 3,
            constraints: const BoxConstraints(
                minHeight: 300, minWidth: 350, maxHeight: double.infinity),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).backgroundColor, //Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextRenderer(
                    child: Text("Mevduat Hesabı Bilgileri",
                        style: TextStyle(color: Colors.orange)),
                  ),
                ),
                _getInterest(context),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextRenderer(
                    child: Text("Kur Korumalı ₺ Mevduat Hesabı Bilgileri",
                        style: TextStyle(color: Colors.orange)),
                  ),
                ),
                _getKurKoruma(context),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextRenderer(
                    child: Text("Vade Sonu Hesabınızdaki Toplam Tutar",
                        style: TextStyle(color: Colors.orange)),
                  ),
                ),
                Text(
                  context
                          .read<Calculator>()
                          .calculateTotal()
                          .toStringAsFixed(2) +
                      " ₺",
                  style: const TextStyle(fontSize: 25, color: Colors.orange),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getKurKoruma(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            TextRenderer(
                child: Text(
              "Vade Başı Kur ",
              style: Theme.of(context).textTheme.bodyText1,
            )),
            FittedBox(
              child: Text(
                context.watch<Calculator>().startCurrency.toStringAsFixed(2) +
                    " ₺",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
        Column(
          children: [
            TextRenderer(
                child: Text(
              "Vade Sonu Kur",
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Text(
              context.watch<Calculator>().endCurrency.toStringAsFixed(2) + " ₺",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Column(
          children: [
            TextRenderer(
                child: Text(
              "Kur Farkı",
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Text(
              context
                      .watch<Calculator>()
                      .calculateCurrenceyDifference()
                      .toStringAsFixed(2) +
                  " ₺",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }

  Widget _getInterest(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            TextRenderer(
              child: Text(
                "Ana Para",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            FittedBox(
                child: Text(
              context.watch<Calculator>().amount.toStringAsFixed(2) + " ₺",
              style: Theme.of(context).textTheme.bodyText1,
            )),
          ],
        ),
        Column(
          children: [
            TextRenderer(
                child: Text(
              "Vade",
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Text(
              context.watch<Calculator>().month.toString() + " ay",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Column(
          children: [
            TextRenderer(
                child: Text(
              "Vade Sonu Faizi",
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Text(
              context
                      .watch<Calculator>()
                      .calculateInterest()
                      .toStringAsFixed(2) +
                  " ₺",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
