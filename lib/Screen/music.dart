import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/music.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Music ? music;

  Widget player(Music ? music) {

  

    this.music = music;
    setState(() {
      
    });
    if (music == null) {
      return Container(
        
        
        color: Colors.blueGrey,
        child: Center(
        
          child: Column(
            children: [
              Icon(Icons.error_outline),
              Text(
                
                "Somthing Wrong",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              
            ],
          ),
        ),
      );
    }

    return Container(

      width: 50,
      height: 50,

    color: Colors.blueGrey,

    child: Column(
      children: <Widget> [
           Text(music.name),
           Image.network(music.images,
           fit: BoxFit.cover,
           )
      ],
    ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        
        color: Colors.blueGrey,
        child: Column(
          children: [
            BackButton(


              color: Colors.black,
            ),

             player(music)
           
          ],
        ),
      ),
    );
  }
}
