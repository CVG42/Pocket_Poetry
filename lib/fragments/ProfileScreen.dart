import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/fragments/edit_profile.dart';
import 'package:zap653/login_screen.dart';
import 'package:zap653/userPreferences/current_user.dart';
import 'package:zap653/userPreferences/user_preferences.dart';

class ProfileScreen extends StatelessWidget {

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

  Widget userInfoItemProfile(IconData iconData, String userData){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(iconData, size: 30, color: Colors.black,),
          const SizedBox(width: 16,),
          Text(userData, style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeee7d7),
      appBar: AppBar(backgroundColor: Color(0xFFeee7d7),),
      drawer: DrawerWidget(),
      body: ListView(
        padding: const EdgeInsets.all(32),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
              ),
                child: Image.asset('images/icon.jpg', width: 240, height: 200,)
            ),
            const SizedBox(height: 20,),
            userInfoItemProfile(Icons.person, _currentUser.user.user_name),
            const SizedBox(height: 20,),
            userInfoItemProfile(Icons.email, _currentUser.user.user_email),
            const SizedBox(height: 20,),
            Center(
              child: Material(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return EditProfile();
                  }));},
                  borderRadius: BorderRadius.circular(32),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text("Editar perfil", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Material(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: (){signOutUser();},
                  borderRadius: BorderRadius.circular(32),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    child: Text("Cerrar sesión", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
