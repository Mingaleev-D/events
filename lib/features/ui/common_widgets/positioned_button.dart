import 'package:flutter/material.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 32,
      right: 32,
      child: FilledButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.black87)),
        onPressed: () => onPressed?.call(),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white)),
      ),
    );
  }
}
