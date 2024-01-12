import 'package:injectable/injectable.dart';

import '../model/event.dart';
import '../model/mock.dart';

const _delay = Duration(seconds: 2);

@lazySingleton
class EventRepository {
  final Set<Event> _favorites = {};

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

  Future<void> saveFavorite(Event event) =>
      Future.delayed(_delay, () => _favorites.add(event));

  Future<void> delete(Event event) =>
      Future.delayed(_delay, () => _favorites.remove(event));

  // Future<void> isFavorite(Event event) =>
  //     Future.delayed(_delay, () => _favorites.contains(event));
  bool isFavorite(Event event) => _favorites.contains(event);

  Future<List<Event>> getFavorites() =>
      Future.delayed(_delay, () => _favorites.toList());
}
