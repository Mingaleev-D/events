import 'package:events/features/data/repository/event_repository.dart';
import 'package:events/features/ui/bloc/event_list/event_list_bloc.dart';
import 'package:events/features/ui/routes/navigation/home_nav.dart';
import 'package:events/features/ui/screens/home/widgets/event_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di/di.dart';
import '../../../../data/model/mock.dart';
import 'event_item.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventListBloc, EventListState>(
      builder: (context, state) {
        return state.when(
          initial: (isLoading, category, events) => isLoading
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: EventShimmerItem(),
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
                  itemCount: 10)
              : (events.isEmpty)
                  ? Center(
                      child: Text(
                      'No events found',
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => getIt<HomeNav>()
                              .openEventDetails(generateEvents[index]),
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
                      itemCount: generateEvents.length),
        );
      },
    );
  }
}
