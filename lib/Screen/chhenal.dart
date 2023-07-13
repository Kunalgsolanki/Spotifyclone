import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';

class Chhenal extends StatefulWidget {
  const Chhenal({super.key});

  @override
  State<Chhenal> createState() => _ChhenalState();
}
Widget kunal (category ? categoris){

  if ( categoris == null){
     return Container(
        color: Colors.blueGrey,
        child:  Column(
          children: [
             Icon(Icons.error_outline_rounded),
            Center(child: Text(" Something wrong ")),
          ],
        ),
     );
  }
 return Image.network(categoris.imagesUrl);

}

class _ChhenalState extends State<Chhenal> {
  category? categoris;
  @override
  Widget build(BuildContext context, { category ? categoris}) {
    return Scaffold(
    appBar: AppBar(
      title:  Text(" Comedy"),
      
    ),
     body: Container(
      color: Colors.blueGrey,
       child: Column(
        children: <Widget> [
          kunal(categoris)
        ],
       ),
     ),

    );
  }
}