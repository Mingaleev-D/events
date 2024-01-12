import 'package:flutter/material.dart';

class Quantity extends StatelessWidget {
  const Quantity(
      {super.key,
      required this.quantity,
      required this.onIncrement,
      required this.onDecrement});

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.grey.shade300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => onDecrement(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('-', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
          SizedBox(
            width: 18,
            child: Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () => onIncrement(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('+', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    );
  }
}
