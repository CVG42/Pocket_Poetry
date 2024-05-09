import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:zap653/bienvenido.dart';

class Fotos extends StatefulWidget {
  const Fotos({super.key});

  @override
  State<Fotos> createState() => _FotosState();
}

class _FotosState extends State<Fotos> {

  List<String> lst = ['Capsula','Tableta','Gotas'];
  int selectedIndex = 0;

  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo medicamento'),
      ),
      body: GestureDetector(
        onTap:(){
          final FocusScopeNode focus = FocusScope.of(context);
          if(!focus.hasPrimaryFocus && focus.hasFocus){
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: ListView(
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tipo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customRadio(lst[0], 0),
                          customRadio(lst[1], 1),
                          customRadio(lst[2], 2),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text('Informacion general', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text('Nombre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      TextField(
                        cursorColor: Colors.blueAccent,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nombre de medicamento',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blueAccent)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Dosis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      TextField(
                        cursorColor: Colors.blueAccent,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Dosis del medicamento',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blueAccent)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Contenido en empaque', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      TextField(
                        cursorColor: Colors.blueAccent,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Cantidad de tabletas en el empaque',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blueAccent)
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Horario', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                      Center(
                        child: ElevatedButton(
                            onPressed: (){Navigator.of(context).pop();},
                            child: Text('Guardar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF398AE5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  Widget customRadio(String txt, int index){
    return OutlinedButton(
        onPressed: (){
          changeIndex(index);
        },
        child: Text(txt, style: TextStyle(color: selectedIndex == index ? Colors.blueAccent : Colors.grey),),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          side: BorderSide(color: selectedIndex == index ? Colors.blueAccent : Colors.grey),
          backgroundColor: selectedIndex == index ? Colors.blue[50] : Colors.transparent,
        ),
    );
  }
}
