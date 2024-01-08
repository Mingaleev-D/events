import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../model/event.dart';

class SliverImageAppBar extends StatelessWidget {
  const SliverImageAppBar({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.arrow_step_back_20_filled),
          ),
        ),
      ),
      expandedHeight: size.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          event.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
