part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial({
    required bool isLoading,
    required List<Event>? events,
  }) = _InitialFavoriteEvent;
}
