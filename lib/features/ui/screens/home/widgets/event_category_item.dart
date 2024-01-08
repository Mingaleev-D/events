import 'package:flutter/material.dart';

class EventCategoryItem extends StatelessWidget {
  const EventCategoryItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.isLast,
    required this.isFirst,
  });

  final bool isActive;
  final String text;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: isLast
          ? const EdgeInsets.only(right: 16.0)
          : EdgeInsets.only(left: isFirst ? 16.0 : 8.0),
      duration: const Duration(milliseconds: 700),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isActive ? const Color(0xff214d42) : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isActive ? const Color(0xffd5dd6e) : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
