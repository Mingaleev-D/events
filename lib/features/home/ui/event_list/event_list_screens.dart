import 'package:events/features/home/ui/widgets/event_category.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/event_list.dart';
import '../widgets/search_box.dart';

class EventListScreens extends StatelessWidget {
  const EventListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            SearchBox(),
            Gap(16),
            EventCategory(
              activeCategory: 'all',
            ),
            Expanded(child: EventList()),
          ],
        ),
      ),
    );
  }
}
