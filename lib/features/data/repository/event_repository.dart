import 'package:injectable/injectable.dart';

import '../model/event.dart';
import '../model/mock.dart';

const _delay = Duration(seconds: 2);

@injectable
class EventRepository {
  Future<List<Event>> getEvents(String? category) {
    return Future.delayed(_delay, () {
      if (category == null || category == 'all') {
        return generateEvents;
      }
      return generateEvents
          .where((event) => event.category.contains(category))
          .toList();
    });
  }

  Future<List<Event>> getEventByName(String searchText) {
    return Future.delayed(
        _delay,
        () => generateEvents
            .where((element) =>
                element.name.toLowerCase().contains(searchText.toLowerCase()))
            .toList());
  }
}
