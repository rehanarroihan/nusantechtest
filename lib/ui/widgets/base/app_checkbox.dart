import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  AppCheckbox({
    @required this.value,
    @required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
