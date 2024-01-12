import 'package:events/core/extensions/event_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/event.dart';
import '../../../common_widgets/quantity.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.event,
    this.withQuantity = false,
    this.quantity = 1,
    this.onIncrement,
    this.onDecrement,
  });

  final Event event;
  final bool withQuantity;
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    final _totalCount = event.cost * quantity;
    final _totalDiscount =
        (event.discountCost == null) ? '' : (event.discountCost! * quantity);
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
                event.presentableDate(),
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
              if (withQuantity)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Quantity(
                    quantity: quantity,
                    onIncrement: () => onIncrement!(),
                    onDecrement: () => onDecrement!(),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 8.0),
          child: Column(
            children: [
              Text(
                event.cost == 0 ? 'free' : '${_totalCount} \₽',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                event.discountCost == null ? '' : '${_totalDiscount} \₽',
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
