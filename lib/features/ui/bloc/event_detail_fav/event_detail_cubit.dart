import 'package:bloc/bloc.dart';
import 'package:events/features/data/model/event.dart';
import 'package:events/features/data/repository/event_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventDetailCubit extends Cubit<bool> {
  EventDetailCubit(this._eventRepository) : super(false);

  final EventRepository _eventRepository;

  Future<void> toggleFavorite(Event event) async {
    emit(!state);

    if (state) {
      await _eventRepository.saveFavorite(event);
    } else {
      await _eventRepository.delete(event);
    }
  }

  void isFavorite(Event event) {
    final isFavorite = _eventRepository.isFavorite(event);
    emit(isFavorite);
  }
}
