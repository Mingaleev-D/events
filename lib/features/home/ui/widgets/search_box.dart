import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0x0f000000),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    prefixIcon: const Icon(FluentIcons.search_20_regular),
                    border: InputBorder.none,
                    hintText: 'Search by event name',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black26),
                    prefixIconConstraints:
                        BoxConstraints.tight(const Size.fromRadius(18))),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(FluentIcons.send_20_regular))
      ],
    );
  }
}
