import 'package:events/features/model/event.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

  final Event event;

  String get _data {
    if (event.endDate?.isNotEmpty ?? false) {
      return '${event.startDate} - ${event.endDate}';
    }
    return event.startDate;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: SizedBox(
            width: 70,
            child: AspectRatio(
              aspectRatio: 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  event.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _data,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                event.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                event.location ?? 'Online',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 8.0),
          child: Column(
            children: [
              Text(
                event.cost == '0' ? 'free' : '${event.cost} \₽',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                event.discountCost == null ? '' : '${event.discountCost} \₽',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
