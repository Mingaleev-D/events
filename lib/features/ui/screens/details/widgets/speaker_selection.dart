import 'package:flutter/material.dart';

import '../../../../data/model/event.dart';

class SpeakerSelection extends StatelessWidget {
  const SpeakerSelection({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('Speakers: ',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    event.speakers.length,
                    (index) => IntrinsicWidth(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(
                                    event.speakers[index].imagePath),
                              ),
                            ),
                            title: Text(
                              event.speakers[index].name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              event.speakers[index].profession,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        )),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
