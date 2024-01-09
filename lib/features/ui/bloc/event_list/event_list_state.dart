part of 'event_list_bloc.dart';

@freezed
class EventListState with _$EventListState {
  const factory EventListState.initial({
    @Default(true) bool isLoading,
    @Default('all') String category,
    @Default(<Event>[]) List<Event> events,
  }) = _InitialEventListState;
}
