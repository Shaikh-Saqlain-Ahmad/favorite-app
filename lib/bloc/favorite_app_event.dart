import 'package:equatable/equatable.dart';
import 'package:favorite_app/model/favorite-item-model.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();
  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavouriteEvents {}

class FavouriteItem extends FavouriteEvents {
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvents {
  final FavouriteItemModel item;
  const SelectItem({required this.item});
}

class UnselectItem extends FavouriteEvents {
  final FavouriteItemModel item;
  const UnselectItem({required this.item});
}
