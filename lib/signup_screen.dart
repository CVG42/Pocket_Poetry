import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zap653/api_connection/api_connection.dart';
import 'package:zap653/bienvenido.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zap653/fragments/dashboard_of_fragments.dart';
import 'package:zap653/login_screen.dart';
import 'package:zap653/models/user.dart';
import 'package:zap653/userPreferences/user_preferences.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpState();
}

class _SingUpState extends State<SingUpScreen> {

  var nameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  validateUserEmail() async{

    try{
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailCtrl.text.trim(),
        }
      );

      if(res.statusCode == 200)
      {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if(resBodyOfValidateEmail['emailFound'] == true)
        {
          Fluttertoast.showToast(msg: "Email ya esta en uso. Seleccione otro email.");
          setState(() {
            emailCtrl.clear();
          });
        }
        else
          {
            regAndSave();
          }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
    }


  regAndSave() async
  {
    User userModel = User(
      1,
      nameCtrl.text.trim(),
      emailCtrl.text.trim(),
      passwordCtrl.text.trim(),
    );

    try{
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200){
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'] == true){
          Fluttertoast.showToast(msg: "Se ha registrado correctamente");

          try{
            var res = await http.post(
              Uri.parse(API.login),
              body: {
                "user_email": emailCtrl.text.trim(),
                "user_password": passwordCtrl.text.trim(),
              },
            );

              var resBodyOfLogin = jsonDecode(res.body);
                Fluttertoast.showToast(msg: "Logged in.");
                User userInfo = User.fromJson(resBodyOfLogin["userData"]);

                await RememberUserPrefs.saveRememberUser(userInfo);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return DashboardOfFragments();
                }));
          }
          catch(errorMsg)
          {
            print("Error :: " + errorMsg.toString());
          }
        }
        else{
          Fluttertoast.showToast(msg: "Error Occurred, try again.");
          setState(() {
            nameCtrl.clear();
            emailCtrl.clear();
            passwordCtrl.clear();
          });
        }
      }
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
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
                      colors: [Color(0xFFeee7d7), Color(0xFFeee7d7)],
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
                            Image.asset('images/inkwell1.png', width: 200, height: 200,),
                            SizedBox(height: 20),
                            Text('Sing Up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
                            SizedBox(height: 20,),
                            TextField(
                              controller: nameCtrl,
                              cursorColor: Colors.blueAccent,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Ingresa tu name',
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
                              controller: emailCtrl,
                              cursorColor: Colors.blueAccent,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Ingresa tu email',
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
                                  hintText: 'Ingresa tu contraseña',
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

                                    validateUserEmail();

                                    FocusScope.of(context).unfocus();



                                  },
                                    child: Text('Registrarse', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
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
                                Text('¿Ya tienes cuenta?', style: TextStyle(color: Colors.black),),
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                        return LoginScreen();
                                      }));
                                    },
                                    child: Text("Ingresa aqui", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),))
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
