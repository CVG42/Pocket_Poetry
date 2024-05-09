import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zap653/fotos.dart';
import 'package:zap653/menu.dart';
import 'package:zap653/tidal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class Bienvenido extends StatefulWidget {

  var usuario;

  Bienvenido(this.usuario,{super.key});

  @override
  State<Bienvenido> createState() => _BienvenidoState();
}

class _BienvenidoState extends State<Bienvenido> {

  Future cerrar_sesion() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context){
      return Tidal();
    }), (route) => false);
  }

  more() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ElevatedButton(
                      onPressed: (){Navigator.of(context).pop();},
                      child: Text('Completar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF398AE5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  ),
                  ElevatedButton(
                    onPressed: (){Navigator.of(context).pop();},
                    child: Text('Eliminar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Bienvenido'),
      ),
      drawer: Menu(widget.usuario),
      body: ListView(
        children:[ Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 0),
                      child: Text('Bienvenido', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),),
                    ),
                    SizedBox(width: 88,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                            return Fotos();
                          }));
                        },
                        child: Text("Agregar +", style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            backgroundColor: Color(0xFF398AE5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
                  },
                  headerProps: const EasyHeaderProps(
                    monthPickerType: MonthPickerType.switcher,
                    dateFormatter: DateFormatter.fullDateDMY(),
                  ),
                  dayProps: const EasyDayProps(
                    height: 60.0,
                    width: 60.0,
                    dayStructure: DayStructure.dayStrDayNum,
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF73AEF5),
                            Color(0xFF61A4F1),
                            Color(0xFF478DE0),
                            Color(0xFF398AE5),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,),
                padding: EdgeInsets.only(left: 15, right: 15,),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF398AE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Genoprazol', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('7:00 PM', style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                        Text('2 tabletas', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(width: 210,),
                    IconButton(
                        onPressed: (){more();},
                        icon: Icon(Icons.more_vert, color: Colors.white,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,),
                padding: EdgeInsets.only(left: 15, right: 15,),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF398AE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Genoprazol', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('7:00 PM', style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                        Text('2 tabletas', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(width: 210,),
                    IconButton(
                        onPressed: (){more();},
                        icon: Icon(Icons.more_vert, color: Colors.white,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,),
                padding: EdgeInsets.only(left: 15, right: 15,),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF398AE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Genoprazol', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('7:00 PM', style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                        Text('2 tabletas', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(width: 210,),
                    IconButton(
                        onPressed: (){more();},
                        icon: Icon(Icons.more_vert, color: Colors.white,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,),
                padding: EdgeInsets.only(left: 15, right: 15,),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF398AE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Genoprazol', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('7:00 PM', style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                        Text('2 tabletas', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(width: 210,),
                    IconButton(
                        onPressed: (){more();},
                        icon: Icon(Icons.more_vert, color: Colors.white,)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  cerrar_sesion();
                },
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
          //child: Text('Bienvenido ' + widget.usuario, style: TextStyle(fontSize: 40),),
        ),
      ]),
    );
  }
}
