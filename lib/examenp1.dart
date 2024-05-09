import 'package:flutter/material.dart';

class cinepolis extends StatefulWidget {
  const cinepolis({super.key});

  @override
  State<cinepolis> createState() => _cinepolisState();
}

class _cinepolisState extends State<cinepolis> {

  ciudades(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('La Perla - 1.68 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('VIP La Perla - 1.68 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('Ciudadela Lifestyle Center - 2.51 km', style: TextStyle(color: Colors.blue),),
                  Divider(),
                  Text('Arboledas - 3.10 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('Centro Sur - 4.11 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('VIP Gran Plaza - 4.70 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('La Gran Plaza - 4.95 km', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('Plaza México - 5.49', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                  Text('Centro Magno - 5.60', style: TextStyle(color: Colors.blue[900]),),
                  Divider(),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromRGBO(0, 04, 7, 1), Color.fromRGBO(8, 38, 88, 1)]
                    )
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Cartelera', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Icon(Icons.now_widgets_outlined, color: Colors.white,),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Image.asset('images/panda.png'),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(54, 201, 217, 1), Colors.blue])),
                    child: ElevatedButton(
                        onPressed: (){ciudades();},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Text('Ciudadela Lifestyle Center - 2.5 km', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                            Padding(
                              padding: const EdgeInsets.only(left: 95),
                              child: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text('Hoy, Martes 05 De Marzo', style: TextStyle(color: Colors.blue[900]),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170),
                      child: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue[900],),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset('images/57.png', width: 90,),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('57 Segundos Atrás', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow.shade800, width: 2),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                  child: Text('B',style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.access_time, color: Colors.blue[900], size: 20,),
                            SizedBox(width: 5,),
                            Text('99 min', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w400, fontSize: 12),),
                            SizedBox(width: 20,),
                            Icon(Icons.movie_outlined, color: Colors.blue[900], size: 20),
                            SizedBox(width: 5,),
                            Text('Suspenso', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w400, fontSize: 12),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text('ESP', style: TextStyle(color: Colors.blue[900]),),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('04:30 PM', style: TextStyle(fontSize: 12),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text('SUB', style: TextStyle(color: Colors.blue[900])),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('09:10 PM', style: TextStyle(fontSize: 12),),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset('images/anatomia.png', width: 90,),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Anatomía de Una Caída', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.yellow.shade800, width: 2),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                  child: Text('B',style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.access_time, color: Colors.blue[900], size: 20,),
                            SizedBox(width: 5,),
                            Text('151 min', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w400, fontSize: 12),),
                            SizedBox(width: 20,),
                            Icon(Icons.movie_outlined, color: Colors.blue[900], size: 20),
                            SizedBox(width: 5,),
                            Text('Drama,Thriller', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w400, fontSize: 12),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text('SUB', style: TextStyle(color: Colors.blue[900])),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('06:30 PM', style: TextStyle(fontSize: 12),),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
