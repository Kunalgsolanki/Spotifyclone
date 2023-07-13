
import 'package:flutter/material.dart';


class YourLibrabry extends StatefulWidget {
  const YourLibrabry({super.key});

  @override
  State<YourLibrabry> createState() => _YourLibrabryState();
}

class _YourLibrabryState extends State<YourLibrabry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center( child: Text(" Libarbsry Screeen",style: TextStyle(color: Colors.white),),),
      ),
    );
  }
}