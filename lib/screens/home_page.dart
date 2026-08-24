import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4382DF),
        title: Text('Products',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 36,
            color: Colors.white,
            icon: Icon(Icons.search), onPressed: (){
          },
          )
        ],
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu, size: 30,color: Colors.white,),
        ),
      ),

    );
  }
}
