import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/event.dart';
import '../../../data/repository/event_repository.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

part 'favorite_bloc.freezed.dart';

@lazySingleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this._eventRepository)
      : super(
          const FavoriteState.initial(
            isLoading: true,
            events: null,
          ),
        ) {
    on<FavoriteEvent>((event, emit) => event.when(load: () => _onLoad(emit)));
  }

  final EventRepository _eventRepository;

  Future<void> _onLoad(Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final events = await _eventRepository.getFavorites();
    emit(state.copyWith(
      isLoading: false,
      events: events,
    ));
  }
}
