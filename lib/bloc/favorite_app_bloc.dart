import 'package:bloc/bloc.dart';
import 'package:favorite_app/bloc/favorite_app_event.dart';
import 'package:favorite_app/bloc/favorite_app_state.dart';
import 'package:favorite_app/model/favorite-item-model.dart';
import 'package:favorite_app/repository/favourite-repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavoriteRepository favouriteRepository;
  FavouriteBloc({required this.favouriteRepository})
      : super(const FavouriteItemState()) {
    on<FetchFavoriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnselectItem>(_unselectItem);
  }
  void fetchList(
      FetchFavoriteList event, Emitter<FavouriteItemState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteItemState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteItemState> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unselectItem(
      UnselectItem event, Emitter<FavouriteItemState> emit) async {
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }
}
