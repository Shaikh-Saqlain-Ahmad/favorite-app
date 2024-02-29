import 'package:equatable/equatable.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();
  @override
  List<Object> get props => [];
}

class FetchFavoriteList extends FavouriteEvents {}
