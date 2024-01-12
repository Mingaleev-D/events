import 'package:events/core/extensions/event_extensions.dart';
import 'package:events/features/ui/bloc/event_detail_fav/event_detail_cubit.dart';
import 'package:events/features/ui/bloc/favorite/favorite_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/event.dart';

class EventSection extends StatelessWidget {
  const EventSection({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    event.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                BlocConsumer<EventDetailCubit, bool>(
                  listener: (context, isFavorite) => context
                      .read<FavoriteBloc>()
                      .add(const FavoriteEvent.load()),
                  builder: (context, isFavorite) {
                    return IconButton(
                        onPressed: () => context
                            .read<EventDetailCubit>()
                            .toggleFavorite(event),
                        icon: Icon(isFavorite
                            ? FluentIcons.bookmark_20_filled
                            : FluentIcons.bookmark_20_regular));
                  },
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(event.presentableDate(),
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(event.location, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Price for 1 person:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                if (event.discountCost != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                        event.discountCost == 0
                            ? ''
                            : '${event.discountCost} \₽',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                            )),
                  ),
                Text(
                  event.cost == 0 ? 'free' : '${event.cost} \₽',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            const SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
