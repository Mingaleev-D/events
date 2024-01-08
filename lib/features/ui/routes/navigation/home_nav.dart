import 'package:events/features/ui/routes/app_router.dart';
import 'package:events/features/ui/routes/app_router.gr.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/event.dart';

@lazySingleton
class HomeNav {
  HomeNav(this._appRouter);
  final AppRouter _appRouter;

  void openEventDetails(Event event) =>
      _appRouter.push(EventDetailsRoute(event: event));
}