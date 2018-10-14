import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movie_bloc.dart';

class movieDetail extends StatelessWidget {
  var link, title = "";
  movieDetail(String _link, String _title) {
    link = _link;
    title = _title;
  }
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
        body: Padding(padding: EdgeInsets.only(top: 20.0) ,  child:  Center(child :
        Column(children: <Widget>[
          Image.network(
            link,
            fit: BoxFit.cover,
          ),
          Padding(
              child: Text(
                title,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0))
        ], crossAxisAlignment: CrossAxisAlignment.center))));
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
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: Column(children: <Widget>[
                Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                  fit: BoxFit.cover,
                ),

              ], crossAxisAlignment: CrossAxisAlignment.stretch ,),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => movieDetail('https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}' , '${snapshot.data.results[index].title}' )));
              });
        });
  }
}
