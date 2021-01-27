import 'package:flutter/material.dart';
import 'package:nusantechtest/models/input_number_model.dart';
import 'package:nusantechtest/ui/widgets/base/app_checkbox.dart';
import 'package:nusantechtest/ui/widgets/base/box_input.dart';

class InputRow extends StatefulWidget {
  final ValueChanged<InputNumberModel> onChanged;

  InputRow({this.onChanged});

  @override
  _InputRowState createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  TextEditingController _input = TextEditingController();
  bool isChecked = false;

  InputNumberModel input = InputNumberModel();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: BoxInput(
            controller: _input,
            keyboardType: TextInputType.number,
            placeholder: 'Masukkan Angka',
            onChanged: (value) {
              int inputVal = 0;
              if (value != '') {
                inputVal = int.parse(value.toString());
              }
              setState(() {
                input.inputNumber = inputVal;
              });
              widget.onChanged(input);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: AppCheckbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
                input.isActive = value;
              });
              widget.onChanged(input);
            }
          ),
        )
      ],
    );
  }
}
