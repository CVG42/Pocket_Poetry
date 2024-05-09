import 'package:flutter/material.dart';
import 'package:zap653/fragments/ProfileScreen.dart';
import 'package:zap653/fragments/author_about.dart';
import 'package:zap653/fragments/dashboard_of_fragments.dart';
import 'package:zap653/fragments/poems.dart';
import 'package:zap653/login_screen.dart';
import 'package:zap653/userPreferences/current_user.dart';
import 'package:get/get.dart';
import 'package:zap653/userPreferences/user_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

final CurrentUser _currentUser = Get.put(CurrentUser());

signOutUser() async{
  var resultResponse = await Get.dialog(AlertDialog(
    title: const Text("Cerrar Sesión", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    content: const Text("¿Estás seguro que quieres cerrar sesión?"),
    actions: [
      TextButton(onPressed: (){
        Get.back();
      }, child: const Text("No", style: TextStyle(color: Colors.black))),
      TextButton(onPressed: (){
        Get.back(result: "loggedOut");
      }, child: const Text("Sí", style: TextStyle(color: Colors.black))),
    ],
  ));

  if(resultResponse == "loggedOut"){
    RememberUserPrefs.removeUserInfo().then((value){Get.off(LoginScreen());});
  }
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/angel.png"), fit: BoxFit.fill)
            ),
              child: Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Text('Pocket Poetry', style: TextStyle(fontFamily: 'ebgaramont', color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24),)
              ,)
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return DashboardOfFragments();
              }));
            },
            title: Text("Inicio"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return PoemIndex();
              }));
            },
            title: Text("Indece de Poemas"),
            leading: Icon(Icons.book),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return ProfileScreen();
              }));
            },
            title: Text("Perfil"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return AuthorAbout();
              }));
            },
            title: Text("Acerca de autor"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              signOutUser();
            },
            title: Text("Cerrar sesión", style: TextStyle(color: Colors.redAccent),),
            leading: Icon(Icons.logout_rounded, color: Colors.redAccent,),
          ),
        ],
      ),
    );
  }
}
