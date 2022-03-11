import 'package:flutter/material.dart';
import 'package:kurkoruma/state/calculator.dart';
import 'package:provider/src/provider.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class MonthCombo extends StatefulWidget {
  const MonthCombo({Key? key}) : super(key: key);

  @override
  State<MonthCombo> createState() => _MonthComboState();
}

class _MonthComboState extends State<MonthCombo> {
  List months = [3, 6, 9, 12];

  List<DropdownMenuItem<int>>? _dropDownMenuItems;
  int? _selectedMonth;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _selectedMonth = _dropDownMenuItems?[0].value;
    super.initState();
  }

  List<DropdownMenuItem<int>> getDropDownMenuItems() {
    List<DropdownMenuItem<int>> items = [];
    for (int month in months) {
      items.add(DropdownMenuItem(
          value: month,
          child: Text(month.toString() + " ay",
              style: const TextStyle(color: Colors.black))));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextRenderer(child: Text("Vade Süresi:")),
          DropdownButton(
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            value: context.watch<Calculator>().month,
            items: _dropDownMenuItems,
            onChanged: (value) {
              changedDropDownItem(value as int?, context);
            },
          )
        ],
      ),
    );
  }

  void changedDropDownItem(int? selectedMonth, BuildContext context) {
    setState(() {
      context.read<Calculator>().setMonth(selectedMonth ?? 3);
      _selectedMonth = selectedMonth;
    });
  }
}
