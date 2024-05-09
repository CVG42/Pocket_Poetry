import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zap653/api_connection/api_connection.dart';
import 'package:zap653/bienvenido.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zap653/fotos.dart';
import 'package:zap653/fragments/dashboard_of_fragments.dart';
import 'package:zap653/models/user.dart';
import 'package:zap653/signup_screen.dart';
import 'package:zap653/userPreferences/user_preferences.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  loginUser() async
  {
    try{
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailCtrl.text.trim(),
          "user_password": passwordCtrl.text.trim(),
        },
      );

      if(res.statusCode == 200){
        var resBodyOfLogin = jsonDecode(res.body);
        if(resBodyOfLogin['success'] == true){
          Fluttertoast.showToast(msg: "Logged in.");
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          await RememberUserPrefs.saveRememberUser(userInfo);
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return DashboardOfFragments();
          }));
        }
        else{
          Fluttertoast.showToast(msg: "Please write correct password or email, try again.");
          setState(() {
            emailCtrl.clear();
            passwordCtrl.clear();
          });
        }
      }
    }
    catch(errorMsg)
    {
      print("Error :: " + errorMsg.toString());
    }
  }

  forgot(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text('Se ha mandado un correo para recuperar contraseña'),
            actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Aceptar'))],
          );
        });
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
                      colors: [Color(0xFFeee7d7),
                        Color(0xFFeee7d7),
                        ],
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
                            Image.asset('images/logo_bdc.png', width: 200, height: 200,),
                            SizedBox(height: 20),
                            Text('Pocket Poetry', style: TextStyle(fontFamily: 'ebgaramont' ,color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
                            SizedBox(height: 20),
                            Text('Ingresa', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(height: 20,),
                            TextField(
                              controller: emailCtrl,
                              cursorColor: Colors.blueAccent,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Escribe tu email',
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
                              controller: passwordCtrl,
                              cursorColor: Colors.blueAccent,
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Escribe tu contraseña',
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

                                    loginUser();

                                    FocusScope.of(context).unfocus();



                                  },
                                    child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 15),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Divider(color: Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: (){
                                      forgot();
                                    },
                                    child: Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('¿No tienes cuenta?', style: TextStyle(color: Colors.black),),
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                        return SingUpScreen();
                                      }));
                                    },
                                    child: Text("Registrate", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),))
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
