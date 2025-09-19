part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.value(int count) = _Value;
  const factory AppState.loading() = _Loading;
  const factory AppState.loaded() = _Loaded;
}
