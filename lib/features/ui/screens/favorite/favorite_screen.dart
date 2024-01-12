import 'package:auto_route/annotations.dart';
import 'package:events/di/di.dart';
import 'package:events/features/ui/bloc/favorite/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/navigation/home_nav.dart';
import '../home/widgets/event_item.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavoriteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) => state.when(
            initial: (isLoading, events) => isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                : (events != null && events.isEmpty)
                    ? Center(
                        child: Text(
                        'No favorite events',
                        style: Theme.of(context).textTheme.labelMedium,
                      ))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => getIt<HomeNav>()
                                .openEventDetails(events[index]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: EventItem(
                                event: events[index],
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
                        itemCount: events!.length),
          ),
        ),
      ),
    );
  }
}
