import 'package:flutter/material.dart';

class ResultSection extends StatelessWidget {
  final double value;

  ResultSection(this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Hasil:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          ),
        )
      ],
    );
  }
}
