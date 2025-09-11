import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'event/app_event.dart';
part 'state/app_state.dart';

class AuthBloc extends Bloc<AppEvent, AppState> {
  AuthBloc() : super(const AppState.initial()) {
    on<_Login>((event, emit) {
      emit(const AppState.initial());
    });

    on<_Logout>((event, emit) {
      emit(const AppState.loading());
    });

    on<_Registration>((event, emit) {
      emit(const AppState.loading());
    });
  }
}
