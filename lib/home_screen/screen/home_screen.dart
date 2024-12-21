import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingDate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter with Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color:Colors.white,
                    clipBehavior: Clip.hardEdge,
                      child: GridTile(
                    footer: GridTileBar(
                      title: Text(state.productList[index].title),
                      backgroundColor: Colors.black54,
                    ),
                    header: GridTileBar(
                      title:
                          Text(state.productList[index].price.toString() ?? ""),
                      backgroundColor: Colors.black54,
                    ),
                    child: Image.network(state.productList[index].image!),
                  ));
                });
          }
          if (state is HomeError) {
            return const Center(
              child: Icon(
                Icons.error,
                size: 120,
              ),
            );
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const Card();
              });
        },
      ),
    );
  }
}
