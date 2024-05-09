import 'package:flutter/material.dart';

//para crear clase escribimos stless
class FilasColumnas extends StatelessWidget {
  const FilasColumnas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Filas y columnas', style: TextStyle(color: Colors.white),),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(flex: 2, child: Image.asset('images/chew.png')),
          Expanded(flex: 1, child: Image.asset('images/jarjar.jpg')),
          Expanded(flex: 1, child: Image.asset('images/nutella.jpg'))
          //Text('Hola'),
        ],
      )
    );
  }
}
