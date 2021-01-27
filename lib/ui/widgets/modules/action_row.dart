import 'package:flutter/material.dart';
import 'package:nusantechtest/ui/widgets/base/button.dart';

class ActionRow extends StatelessWidget {
  final Function onAdd, onSubtract, onMultiplicate, onDivide;

  ActionRow({
    @required this.onAdd,
    @required this.onSubtract,
    @required this.onMultiplicate,
    @required this.onDivide
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Button(text: '+', onClick: onAdd),
        Button(text: '-', onClick: onSubtract),
        Button(text: 'x', onClick: onMultiplicate),
        Button(text: '/', onClick: onDivide),
      ],
    );
  }
}
