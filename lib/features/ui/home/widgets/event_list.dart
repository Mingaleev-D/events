import 'package:events/features/ui/home/widgets/event_item.dart';
import 'package:flutter/material.dart';

import '../../model/mock.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: EventItem(
                event: generateEvents[index],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.black12,
            height: 0,
          );
        },
        itemCount: generateEvents.length);
  }
}