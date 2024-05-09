import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/poems/poem1.dart';
import 'package:zap653/poems/poem3.dart';

class Poem2 extends StatefulWidget {
  const Poem2({super.key});

  @override
  State<Poem2> createState() => _Poem2State();
}

class _Poem2State extends State<Poem2> {
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
                Text('extra vitam', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 36),),
                SizedBox(height: 20,),
                Image(image: AssetImage('images/art2.jpg'), width: 250, height: 200,),
                SizedBox(height: 30,),
                Text('366 nuevos soles, lunas', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('anhelos, caídas y sobre todo,', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('génesis de recuerdos.', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                Text('¿Realmente hay algo que perder?', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return Poem1();
                        }));
                      },
                      child: Text("Anterior", style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 40,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return Poem3();
                        }));
                      },
                      child: Text("Siguiente", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                )
              ],
            ),
          ),
          ]),
    );
  }
}
