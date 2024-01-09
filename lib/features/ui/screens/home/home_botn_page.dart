import 'package:auto_route/auto_route.dart';
import 'package:events/features/ui/routes/app_router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeBotnPage extends StatelessWidget {
  const HomeBotnPage({super.key});

  static const _items = [
    BottomNavigationBarItem(
        icon: Icon(FluentIcons.building_home_20_regular), label: 'Events'),
    BottomNavigationBarItem(
        icon: Icon(FluentIcons.bookmark_multiple_20_regular),
        label: 'Favorite'),
  ];

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return AutoTabsScaffold(
      routes: const [
        EventListRoutes(),
        FavoriteRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        items: _items,
        elevation: 0,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
