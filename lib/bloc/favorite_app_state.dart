import 'package:equatable/equatable.dart';
import 'package:favorite_app/model/favorite-item-model.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;
  const FavouriteItemState(
      {this.favouriteItemList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteItemState copyWith(
      {List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteItemState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteItemList];
}
