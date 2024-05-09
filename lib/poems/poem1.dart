import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/fragments/poems.dart';
import 'package:zap653/poems/poem2.dart';

class Poem1 extends StatefulWidget {
  const Poem1({super.key});

  @override
  State<Poem1> createState() => _Poem1State();
}

class _Poem1State extends State<Poem1> {
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
                Text('exceptio xviii', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 36),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/art.jpg'), width: 250, height: 200,),
                SizedBox(height: 30,),
                Text('Dejé de desperdiciar mis', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('lágrimas en pañuelos para', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('derramarlas en pergaminos y', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('volverlas poesía', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
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
                  child: Text("Siguiente", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
          ]),
    );
  }
}
