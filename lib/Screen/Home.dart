import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/chhenal.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/music.dart';
import 'package:flutter_application_1/services/category_opration.dart';
import 'package:flutter_application_1/services/music_Opration.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  Function _miniplayer;
  HomeScreen(
    this._miniplayer,
  );
  

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHovered = false;
  
  

  Widget createCategory(category category, {Music? music}) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              height: 60,
              child: GestureDetector(
                onTap: (() { 
                                 Navigator.of(context).push(_createRoute());
      
        
                
                }),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      category.imagesUrl,
                      fit: BoxFit.cover,
                    )),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              category.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListofCategories() {
    // ignore: unused_local_variable
    List<category> categoryList = categoryOperration.getCategories();
    List<Widget> categoris = categoryList
        .map((category category) => createCategory(category))
        .toList();
    return categoris;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: GestureDetector(
                          onTap: () {
                            widget._miniplayer(music, stop: true);
                          },
                          child: Image.network(
                            music.images,
                            fit: BoxFit.cover,
                          )))),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  width: 200.0,
                  height: 60.0,
                  color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      music.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            music.name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              music.description,
              style:
                  TextStyle(overflow: TextOverflow.clip, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musiclist = MusicOprations.getMusic();

    return Column(
      children: [
        Container(
          height: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musiclist[index]);
              },
              itemCount: musiclist.length),
        ),
      ],
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListofCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createApbar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        message,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context ) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              createApbar(
                "Good morning",
              ),
              SizedBox(
                height: 5,
              ),
              createGrid(),

              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Music for You ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              createMusicList(
                " Music for You",
              ),
              Padding(
                
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  " Recently played ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              createMusicList(
                "Recently ",
              )
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blueGrey.shade100,
            Colors.black,
            Colors.black,
            Colors.black
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
    );
  }
  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Chhenal(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

}




