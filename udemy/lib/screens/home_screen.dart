
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hola guapos desde un appbar qeu guapo"),
        elevation: 0,
        ),
      body: const Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:[
            Text("hola utilizando columnas con una lista de widgets "),
            Text("Esto es para ver las columnas guapas"),
          ],

        ),
        )
    );
  }
}