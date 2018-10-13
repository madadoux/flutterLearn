import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movie_bloc.dart';

class movieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Popular Movies',
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(child: Text("hello", textAlign: TextAlign.center)));
  }
}

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: Column(children: <Widget>[
                Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                  fit: BoxFit.cover,
                ),
                 Text('${snapshot.data.results[index].title}')
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => movieDetail()));
              });
        });
  }
}
