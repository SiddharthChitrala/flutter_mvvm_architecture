import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/vm/movie_list_view_model.dart';
import 'package:flutter_mvvm_architecture/vm/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieListViewModel movieListViewModel = MovieListViewModel();

  @override
  void initState() {
    movieListViewModel.fetchMovieListApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home Screen'),
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red), // Add an icon
                      SizedBox(width: 4), // Add spacing between icon and text
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ]),
        body: ChangeNotifierProvider<MovieListViewModel>(
            create: (BuildContext context) => movieListViewModel,
            child: Consumer<MovieListViewModel>(builder: (context, value, _) {
              switch (value.movieList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());

                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: ( context, index) {
                       final movie = value.movieList.data!.movies![index];
                      return Card(
                        child: ListTile(
                          title: Text(movie.title.toString()),
                          subtitle: Text(movie.year.toString()),
                          leading:Image.network(
                            movie.posterurl.toString(),
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error,color:Colors.redAccent);
                            },
                          ),
                          
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.averageRating(movie.ratings!).toString()),
                              const Icon(Icons.star_sharp , color: Colors.yellow,)
                              ],
                          ),
                        ),
                        
                      );
                    },
                  );

                case Status.ERROR:
                  return Center(
                      child: Text(value.movieList.message.toString()));

                case null:
                  return const Center(child: Text("Null or No Data"));
              }
            })));
  }
}
