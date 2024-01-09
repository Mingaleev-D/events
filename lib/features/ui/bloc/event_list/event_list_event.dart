part of 'event_list_bloc.dart';

@freezed
class EventListEvent with _$EventListEvent {
  const factory EventListEvent.load() = _LoadEventListEvent;
  const factory EventListEvent.changeCategory({required String category}) =
      _ChangeCategoryEventListEvent;
  const factory EventListEvent.search({required String searchText}) =
      _SearchEventListEvent;
}
