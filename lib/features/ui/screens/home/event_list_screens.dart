import 'package:auto_route/annotations.dart';
import 'package:events/di/di.dart';
import 'package:events/features/ui/bloc/event_list/event_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'widgets/event_category.dart';
import 'widgets/event_list.dart';
import 'widgets/search_box.dart';

@RoutePage()
class EventListScreens extends StatelessWidget {
  const EventListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<EventListBloc>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircleAvatar(child: FlutterLogo()),
          ),
          title: Text(
            'github.com/Mingaleev-D',
            style: textTheme.titleMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/imgs/ic_github.png',
                    height: 34,
                    width: 34,
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              const SearchBox(),
              const Gap(16),
              BlocBuilder<EventListBloc, EventListState>(
                builder: (context, state) {
                  return state.when(initial: (_, category, __) {
                    return EventCategory(
                        activeCategory: category,
                        onCategorySelected: (category) => context
                            .read<EventListBloc>()
                            .add(EventListEvent.changeCategory(
                                category: category)));
                  });
                },
              ),
              const Expanded(child: EventList()),
            ],
          ),
        ),
      ),
    );
  }
}
