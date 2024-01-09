import 'package:bloc/bloc.dart';
import 'package:events/features/data/repository/event_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/event.dart';

part 'event_list_event.dart';

part 'event_list_state.dart';

part 'event_list_bloc.freezed.dart';

@injectable
class EventListBloc extends Bloc<EventListEvent, EventListState> {
  EventListBloc(this._eventRepository) : super(const EventListState.initial()) {
    on<EventListEvent>((event, emit) => event.when(
          load: () => _onLoad(emit),
          changeCategory: (category) => _onChangeCategory(category, emit),
          search: (searchText) => _onSearch(searchText, emit),
        ));
    add(const EventListEvent.load());
  }

  final EventRepository _eventRepository;

  Future<void> _onLoad(Emitter<EventListState> emit) async {
    final result = await _eventRepository.getEvents(null);
    emit(state.copyWith(isLoading: false, events: result));
  }

  Future<void> _onChangeCategory(
      String category, Emitter<EventListState> emit) async {
    emit(state.copyWith(isLoading: true, category: category));
    final result = await _eventRepository.getEvents(null);
    emit(state.copyWith(isLoading: false, events: result));
  }

  Future<void> _onSearch(
      String searchText, Emitter<EventListState> emit) async {
    if (searchText.isNotEmpty) {
      emit(state.copyWith(isLoading: true));
      final result = await _eventRepository.getEventByName(searchText);
      emit(state.copyWith(isLoading: false, events: result));
    }
  }
}
