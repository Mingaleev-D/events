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

  void openBooking(Event event) => _appRouter.push(BookingRoute(event: event));
  void openPayment() => _appRouter.push(const PaymentRoute());
  void openStatus(bool isSuccess) =>
      _appRouter.push(StatusRoute(isSuccess: isSuccess));
  void backToBooking() =>
      _appRouter.popUntil((route) => route.settings.name == HomeBotnRoute.name);
}
