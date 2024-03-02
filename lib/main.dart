import 'package:favorite_app/bloc/favorite_app_bloc.dart';
import 'package:favorite_app/repository/favourite-repository.dart';
import 'package:favorite_app/ui/favourite-app-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  FavouriteBloc(favouriteRepository: FavoriteRepository()))
        ],
        child: MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: const FavouriteScreen()));
  }
}
