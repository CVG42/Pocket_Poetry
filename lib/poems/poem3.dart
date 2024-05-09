import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/poems/poem2.dart';

class Poem3 extends StatefulWidget {
  const Poem3({super.key});

  @override
  State<Poem3> createState() => _Poem3State();
}

class _Poem3State extends State<Poem3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeee7d7),
      appBar: AppBar(backgroundColor: Color(0xFFeee7d7),),
      drawer: DrawerWidget(),
      body: ListView(
          children:[ Center(
            child: Column(
              children: [
                Text('intro', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 36),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/art3jpg.jpg'), width: 250, height: 200,),
                SizedBox(height: 30,),
                Text('Tengo miedo de lo', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('ajena que me parece la felicidad;', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('pero no tanto como el pavor de lo', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('que me resulta la misera', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return Poem2();
                    }));
                  },
                  child: Text("Anterior", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
          ]),
    );
  }
}
