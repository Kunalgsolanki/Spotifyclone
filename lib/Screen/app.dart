

// ignore: import_of_legacy_library_into_null_safe



import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'package:flutter_application_1/Screen/Libraray.dart';
import 'package:flutter_application_1/Screen/Search.dart';
import 'package:flutter_application_1/Screen/music.dart';


import 'package:flutter_application_1/models/music.dart';



class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

    AudioPlayer  _audioPlayer = new AudioPlayer();

  var Tabs = [

  ];
  int selectedIndex = 0;
  Music? music;
 
  bool isPlaying = false;
  bool  isVisible = true;
 

      closeMusic( Music ? music){
     
   return SizedBox();
   

  }

  Widget miniplayer(Music? music , { bool stop = false} ) {
    this.music = music;
     setState(() {});
    if (music == null   ) {
      return SizedBox();
       
     
    }
    if ( stop){
        isPlaying = false; 
      
      _audioPlayer.stop();
    }
    setState(() {
      isVisible=true;
    });
    
    Size devicesize = MediaQuery.of(context).size;
    return AnimatedContainer(
       
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
      
      width: devicesize.width,
      

      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(89),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(90.0),
            child: InkWell(
              onTap: () {
      Navigator.of(context).push(_createRoute());
                
              },
              child: Image.network(
                music.images,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: ()  async{
            isPlaying =! isPlaying;
           
            

            if (isPlaying){
      await  _audioPlayer.play(music.adioUrl);
            }
            else{
              await  _audioPlayer.pause();

            }
            setState(() {
              
            });
         
          
          }, icon: isPlaying 
          ? 
          Icon(Icons.pause, color: Colors.white,)
          :Icon(Icons.play_arrow_rounded, color: Colors.white,)),
               Padding(
                 padding: const EdgeInsets.only(left: 94),
                 child:CloseButton(color: Colors.red,
                onPressed: () {
                     
               setState(() {
                 isVisible =!isVisible;
                  _audioPlayer.stop();
               });
 
                 },) 
               )

        ],
      ),
    );
  }
  

  @override
  void initState() {
    super.initState();
     
      setState(() {
          isVisible = false;
      });

   
     Tabs = [HomeScreen(miniplayer), SearchList(), YourLibrabry()];

    
      
      
      setState(() {
        isVisible= !isVisible;
     }); 
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Tabs[selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
            
            Visibility(
               visible: isVisible,
              child: miniplayer(music)),
          BottomNavigationBar(
              selectedLabelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.transparent,
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
                // rerender
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.white),
                    label: "SearchList"),
                BottomNavigationBarItem(
                    icon:
                        Icon(Icons.library_music_outlined, color: Colors.white),
                    label: "YourLibrabry"),
              ]),
        ],
      ),
    );
  }

   Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  MusicScreen(),
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
