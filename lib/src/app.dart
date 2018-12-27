import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../ui/movie_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //theme: ThemeData.light(),
      title: "Ewqewq",
      home: Scaffold(

        //appBar: AppBar(title: Text( "Hello")),
        //drawer: Drawer(child: Container( padding: EdgeInsets.only(top: 50.0) ,child: Column(children: <Widget>[ Text("About Us") , Text("Quit")],)),),
         body:  complexView() ),
      // body : MovieList()  ),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ar', 'EG'), // Hebrew
        // ... other locales the app supports
      ],
    );
  }

Widget complexView () {
    return SingleChildScrollView(
        child: SafeArea(
          child: Column(children: <Widget>[
            Image.network(
              "https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true",
              height: 300.0,
              fit: BoxFit.fitWidth,
            ),
            BuildtitleSection(),
            BuildButtonsSection() ,
            buildDescription()
          ]),
        ));
}
  Container buildDescription() {
    return Container( padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0), child: Text( "Swan Lake (Russian: Лебединое озеро Lebedinoye ozero), Op. 20"
        ", is a ballet composed by Pyotr Ilyich Tchaikovsky in 1875–76. Despite its initial failure, it is now one of the most popular of all ballets.The scen"
        "ario, initially in two acts, was fashioned from Russian and/or German folk tales[a] and tells the story of Odette, a princess turned into a swa"
        " by an evil sorcerer's curse. The choreographer of the original production was Julius Reisinger (Václav Reisinger). The ballet wa"
        "s premiered by the Bolshoi Ballet on 4 March [O.S. 20 February] 1877[1][2] at the Bolshoi Theatre in Moscow. Although it is pres"
        "ented in many different versions, most ballet companies base their stagings both choreographically and musically on the 1895 "
        "revival of Marius Petipa and Lev Ivanov, first staged for the Imperial Ballet on 15 January 1895, at the Mariinsky Theatre in St. "
        "Petersburg. For this revival, Tchaikovsky's score was revised by the St. Petersburg Imperial Theatre's chief conductor and composer Riccardo Drigo.3"
    ,style: TextStyle(color: Colors.blueGrey , fontSize: 14.0 ),
    ));
  }

  Widget BuildTitleImgButton(IconData icon, String title) {
    return MaterialButton(
        child: Column(
      children: <Widget>[Icon(icon), Text(title)],

    ) ,onPressed: () {
          print("hello");
    },);
  }

  Widget BuildButtonsSection() {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BuildTitleImgButton(Icons.call, "Call"),
              BuildTitleImgButton(Icons.near_me, "Route"),
              BuildTitleImgButton(Icons.share, "Share"),
            ]));
  }

  Widget BuildtitleSection() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Swan Lake"),
              Text(
                "Berlin , Germany",
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.star),
              Text(
                "41",
                style: TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
