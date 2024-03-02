import 'package:bloc/bloc.dart';
import 'package:favorite_app/bloc/favorite_app_event.dart';
import 'package:favorite_app/bloc/favorite_app_state.dart';
import 'package:favorite_app/model/favorite-item-model.dart';
import 'package:favorite_app/repository/favourite-repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemState> {
  List<FavouriteItemModel> favouriteList = [];
  FavoriteRepository favouriteRepository;
  FavouriteBloc({required this.favouriteRepository})
      : super(const FavouriteItemState()) {
    on<FetchFavoriteList>(fetchList);
  }
  void fetchList(
      FetchFavoriteList event, Emitter<FavouriteItemState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }
}
