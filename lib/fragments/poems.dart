import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/poems/poem1.dart';
import 'package:zap653/poems/poem2.dart';
import 'package:zap653/poems/poem3.dart';

class PoemIndex extends StatefulWidget {
  const PoemIndex({super.key});

  @override
  State<PoemIndex> createState() => _PoemIndexState();
}

class _PoemIndexState extends State<PoemIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFeee7d7),),
      drawer: DrawerWidget(),
      backgroundColor: Color(0xFFeee7d7),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Text('Creaciones del bolsillo', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 28),),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return Poem1();
                    }));
                  },
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: AssetImage('images/art.jpg'), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.dstATop),)
                    ),
                    child: Center(child: Text('exceptio xviii', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return Poem2();
                  }));},
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: AssetImage('images/art2.jpg'), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.dstATop),)
                    ),
                    child: Center(child: Text('extra vitam', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return Poem3();
                    }));
                  },
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: AssetImage('images/art3jpg.jpg'), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.dstATop),)
                    ),
                    child: Center(child: Text('intro', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
