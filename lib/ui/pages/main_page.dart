import 'package:flutter/material.dart';
import 'package:nusantechtest/models/input_number_model.dart';
import 'package:nusantechtest/ui/widgets/modules/action_row.dart';
import 'package:nusantechtest/ui/widgets/modules/app_alert_dialog.dart';
import 'package:nusantechtest/ui/widgets/modules/input_row.dart';
import 'package:nusantechtest/ui/widgets/modules/result_section.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

enum MathOperation {
  addition,
  subtraction,
  multiplication,
  division
}

class _MainPageState extends State<MainPage> {
  InputNumberModel _inputOne = InputNumberModel();
  InputNumberModel _inputTwo = InputNumberModel();
  InputNumberModel _inputThree = InputNumberModel();

  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nusantech Calc'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InputRow(
                  onChanged: (InputNumberModel value) {
                    setState(() {
                      _inputOne = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InputRow(
                  onChanged: (InputNumberModel value) {
                    setState(() {
                      _inputTwo = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InputRow(
                  onChanged: (InputNumberModel value) {
                    setState(() {
                      _inputThree = value;
                    });
                  },
                ),
              ),
              ActionRow(
                onAdd: () => count(MathOperation.addition, _getNumbers()),
                onSubtract: () => count(MathOperation.subtraction, _getNumbers()),
                onMultiplicate: () => count(MathOperation.multiplication, _getNumbers()),
                onDivide: () => count(MathOperation.division, _getNumbers()),
              ),
              Divider(),
              _result != null ? ResultSection(_result) : Container()
            ],
          ),
        ),
      ),
    );
  }

  List<int> _getNumbers() {
    List<int> numbers = [];

    if (_inputOne.isActive) {
      numbers.add(_inputOne.inputNumber);
    }

    if (_inputTwo.isActive) {
      numbers.add(_inputTwo.inputNumber);
    }

    if (_inputThree.isActive) {
      numbers.add(_inputThree.inputNumber);
    }

    return numbers;
  }

  void count(MathOperation operation, List<int> numbers) {
    if (numbers.length < 2) {
      AppAlertDialog(
        title: 'Perhatian',
        description: 'Pilih / Centang minimal 2 input',
        positiveButtonText: 'Ok',
        positiveButtonOnTap: () => Navigator.pop(context)
      ).show(context);
      return;
    }

    for (int i = 0; i < numbers.length; i++) {
      if (i == 0) {
        setState(() {
          _result = double.parse(numbers[i].toString());
        });
      } else {
        double tempResult;
        switch (operation) {
          case MathOperation.addition:
            tempResult = _result + numbers[i];
            break;
          case MathOperation.subtraction:
            tempResult = _result - numbers[i];
            break;
          case MathOperation.multiplication:
            tempResult = _result * numbers[i];
            break;
          case MathOperation.division:
            tempResult = _result / numbers[i];
            break;
        }

        setState(() {
          _result = tempResult;
        });
      }
    }
  }
}