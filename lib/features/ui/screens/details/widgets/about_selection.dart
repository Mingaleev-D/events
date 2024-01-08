import 'package:flutter/material.dart';

import '../../../../data/model/event.dart';

class AboutSelection extends StatelessWidget {
  const AboutSelection({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About: ', style: Theme.of(context).textTheme.titleMedium),
            Text(event.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
