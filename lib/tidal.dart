import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zap653/bienvenido.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Tidal extends StatefulWidget {
  const Tidal({super.key});

  @override
  State<Tidal> createState() => _TidalState();
}

class _TidalState extends State<Tidal> {

  final c_usuario = TextEditingController();
  final c_password = TextEditingController();

  String usuario = '';
  String pass = '';

  Future guardar_datos(usuario, pass) async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('usuario', usuario);
    await preferences.setString('password', pass);
  }

  mostrar_loading(){
    SmartDialog.show(builder: (BuildContext context){
      return Container(
        height: 60, width: 60,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
        ),
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(
          radius: 15,
          color: CupertinoColors.black,
        ),
      );
    });
  }

  alerta(mensaje){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Primera App'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(mensaje)
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'))
            ],
          );
        });
  }

  validar(usuario, pass){

    c_usuario.text = '';
    c_password.text = '';

    SmartDialog.dismiss();

    if(usuario == '' || pass == '')
      {
        alerta('Debes llenar todos los datos');
      }else if(usuario=='cris' && pass=='123'){

        guardar_datos(usuario, pass);

        /*Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return Bienvenido(usuario);
        }));*/
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context){
        return Bienvenido(usuario);
      }), (route) => false);
    }
    else{
      alerta('Usuario o contraseña incorrecta');
    }
  }

  Future ver_preferencias() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    usuario = await preferences.getString('usuario')!;
    pass = await preferences.getString('password')!;

    if(usuario != null){
      if(usuario != '')
        {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context){
            return Bienvenido(usuario);
          }), (route) => false);
        }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ver_preferencias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black,
        body: GestureDetector(
          onTap:(){
            final FocusScopeNode focus = FocusScope.of(context);
            if(!focus.hasPrimaryFocus && focus.hasFocus){
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Stack(
            children: [
              //Image.asset('images/albums.jpg', fit: BoxFit.cover,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                  colors: [Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),],
                )
              ),
              child: ListView(
                children: [Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Happy Pill', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),
                        SizedBox(height: 40),
                        Text('Log In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 20,),
                        TextField(
                          controller: c_usuario,
                          cursorColor: Colors.blueAccent,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your email or username',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.blueAccent)
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: c_password,
                          cursorColor: Colors.blueAccent,
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blueAccent)
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(onPressed: (){
                                usuario = c_usuario.text;
                                pass = c_password.text;

                                FocusScope.of(context).unfocus();

                                mostrar_loading();
                                validar(usuario, pass);

                              },
                                  child: Text('Continue', style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF398AE5))),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      );
  }
}
