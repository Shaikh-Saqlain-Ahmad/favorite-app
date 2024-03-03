import 'package:favorite_app/bloc/favorite_app_bloc.dart';
import 'package:favorite_app/bloc/favorite_app_event.dart';
import 'package:favorite_app/bloc/favorite_app_state.dart';
import 'package:favorite_app/constants/constants.dart';
import 'package:favorite_app/model/favorite-item-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavoriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: delete,
                    )),
              );
            },
          )
        ],
        backgroundColor: primary,
        title: Text("Favourite List",
            style: TextStyle(color: Colors.white, fontFamily: font)),
        centerTitle: true,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(
                  child: Text(
                "Something went wrong!",
              ));
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: state.tempFavouriteItemList.contains(item)
                            ? true
                            : false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<FavouriteBloc>()
                                .add(SelectItem(item: item));
                          } else {
                            context
                                .read<FavouriteBloc>()
                                .add(UnselectItem(item: item));
                          }
                        },
                      ),
                      title: Text(
                        item.value.toString(),
                        style: TextStyle(fontFamily: font),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel itemModel = FavouriteItemModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true);
                            context
                                .read<FavouriteBloc>()
                                .add(FavouriteItem(item: itemModel));
                          },
                          icon: item.isFavourite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border_outlined)),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
