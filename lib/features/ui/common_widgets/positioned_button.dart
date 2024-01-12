import 'package:flutter/material.dart';

class PositionedButton extends StatelessWidget {
  const PositionedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isEnabled = true});

  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

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
            backgroundColor: isEnabled
                ? MaterialStateProperty.all(Colors.black87)
                : MaterialStateProperty.all(Colors.grey)),
        onPressed: isEnabled ? () => onPressed?.call() : null,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white)),
      ),
    );
  }
}
