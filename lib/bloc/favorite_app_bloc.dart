import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_app_event.dart';
part 'favorite_app_state.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {
  FavoriteAppBloc() : super(FavoriteAppInitial()) {
    on<FavoriteAppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
