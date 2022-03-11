import 'package:flutter/material.dart';
import 'package:kurkoruma/components/calculateButton.dart';
import 'package:kurkoruma/components/currency.dart';
import 'package:kurkoruma/components/interestField.dart';
import 'package:kurkoruma/components/moneyField.dart';
import 'package:kurkoruma/components/monthCombo.dart';
import 'package:kurkoruma/components/result.dart';
import 'package:kurkoruma/components/sample.dart';
import 'package:kurkoruma/components/warning.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:kurkoruma/state/theme_manager.dart';
import 'package:provider/src/provider.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _beginCurrencyController =
      TextEditingController();
  final TextEditingController _endCurrencyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  final Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 50),
              child: IconButton(
                onPressed: () {
                  context.read<ThemeManager>().toggleTheme();
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 54,
            ),
            Wrap(children: [
              TextRenderer(
                child: Text(
                  "KUR KORUMALI TL MEVDUAT HESAPLAMA",
                  style: Theme.of(context).textTheme.headline4,
                  // style: TextStyle(color: Colors.black, fontSize: 35)),
                ),
              )
            ]),
            const SizedBox(height: 40),
            const Resut(),
            const SizedBox(height: 40),
            Center(
              child: Container(
                constraints: const BoxConstraints(
                    minHeight: 400, minWidth: 500, maxHeight: double.infinity),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).backgroundColor,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    MoneyField(controller: _amountController),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const MonthCombo(),
                        InterestField(controller: _interestController),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Currency(
                          title: "Vade başlangıç kuru (₺)",
                          controller: _beginCurrencyController,
                          isStartCurrency: true,
                        ),
                        Currency(
                          title: "Vade bitiş kuru (₺)",
                          controller: _endCurrencyController,
                          isStartCurrency: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                TextRenderer(
                  child: Text(
                    "Örnek Yatırımlar ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                TextRenderer(
                  child: Text(
                      "(Üzerlerine tıklayarak hesaplamaları görebilirsiniz)",
                      style: Theme.of(context).textTheme.headline5),
                )
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Sample(
                  amount: 100000,
                  endCurrency: 11,
                  startCurrency: 10,
                  interest: 14,
                  month: 3,
                  title: "Kur Getirisi Yüksek",
                  updateTextFields: () => updateTextFields(),
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                Sample(
                  amount: 100000,
                  endCurrency: 9,
                  startCurrency: 10,
                  interest: 14,
                  month: 3,
                  title: "Faiz Getirisi Yüksek",
                  updateTextFields: () => updateTextFields(),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Warning(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  updateTextFields() {
    _amountController.text =
        context.read<Calculator>().amount.toStringAsFixed(2);
    _interestController.text =
        context.read<Calculator>().interest.toStringAsFixed(2);
    _beginCurrencyController.text =
        context.read<Calculator>().startCurrency.toStringAsFixed(2);
    _endCurrencyController.text =
        context.read<Calculator>().endCurrency.toStringAsFixed(2);
  }
}
