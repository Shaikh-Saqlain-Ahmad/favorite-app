import 'package:favorite_app/bloc/favorite_app_bloc.dart';
import 'package:favorite_app/bloc/favorite_app_event.dart';
import 'package:favorite_app/bloc/favorite_app_state.dart';
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
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title:
            const Text("Favourite List", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(child: Text("Something went wrong!"));
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.value.toString()),
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
