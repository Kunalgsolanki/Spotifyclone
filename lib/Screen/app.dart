import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.black,
     appBar: AppBar(
      title: Center(child: Text("Spontify App")),
       backgroundColor: Colors.grey[900],
     ),
      
    body: GridView.count(

      crossAxisCount: 2,
      children: List.generate(4, (index)  {
        return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        const ListTile(
          leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              
              
        )
      ],
    ),
        );
           
        
      }),
    ),
    );
  }
}

