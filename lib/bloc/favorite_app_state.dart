part of 'favorite_app_bloc.dart';

sealed class FavoriteAppState extends Equatable {
  const FavoriteAppState();
  
  @override
  List<Object> get props => [];
}

final class FavoriteAppInitial extends FavoriteAppState {}
