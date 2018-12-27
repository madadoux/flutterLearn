import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movie_bloc.dart';

class movieDetail extends StatefulWidget {
  var link, title = "";
  movieDetail(String _link, String _title) {
    link = _link;
    title = _title;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieDetailsState() ;
  }
}
class MovieDetailsState extends State <movieDetail> {
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
        Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly, mainAxisSize: MainAxisSize.max, children: <Widget>[
          Container(
            height: 500.0,
            width: 500.0,
            decoration: new  BoxDecoration( border: Border.all(width: 10.0, color: Colors.black38),
//                    shape: BoxShape.circle,
                borderRadius:
                const BorderRadius.all(const Radius.circular(25.0)),
                image: new DecorationImage(  fit: BoxFit.fill, image : NetworkImage(
                    widget.link
                ))),

          ),
          Padding(
              child: Text(
                widget.title,
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
                child: Column(children: <Widget>[
                  Expanded(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                      fit: BoxFit.cover,
                    ),
                  ),
 Center(child: Text('${snapshot.data.results[index].title}'))
                ], crossAxisAlignment: CrossAxisAlignment.stretch ,),

              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => movieDetail('https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}' , '${snapshot.data.results[index].title}' )));
              });
        });
  }
}
