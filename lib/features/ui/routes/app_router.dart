import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
@lazySingleton
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeBotnRoute.page, initial: true, children: [
          AutoRoute(page: EventListRoutes.page),
          AutoRoute(page: FavoriteRoute.page),
        ]),
        AutoRoute(page: EventDetailsRoute.page),
        AutoRoute(page: BookingRoute.page),
      ];
}
