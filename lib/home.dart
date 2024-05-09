import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Primera app', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child:
          Container(
            //color: Colors.amber,
            margin: EdgeInsets.only(left: 5,top:15,right: 30,bottom: 70),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.amber,
              /*border: Border(
                bottom: BorderSide(
                  width: 4,
                  color: Colors.black
                ),
                top: BorderSide(
                  width: 5,
                  color: Colors.red
                )
              ),*/
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(50)
              ),
              border: Border.all(
                width: 4,
                color: Colors.red
              )
            ),
            child: Text('Hola mundo'),
          ),
        //Image.network('https://knockstore.mx/wp-content/uploads/2020/06/nutella-b-ready-2-e1680290365986.png')
        //Image.asset('images/nutella.jpg', width: 150,)
        /*Text('Hola', style: TextStyle(
          fontSize: 35,
            color: Color(0xffff0000),
            //color: Color.fromRGBO(200, 50, 100, 1),
            //color: Colors.blue, 
            fontFamily: 'rbold'
        ),),*/
      ),
    );
  }
}
