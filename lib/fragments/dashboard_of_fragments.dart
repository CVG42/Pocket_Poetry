import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zap653/DrawerWidget.dart';
import 'package:zap653/fragments/poems.dart';
import 'package:zap653/menu.dart';
import 'package:zap653/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  //const DashboardOfFragments({super.key});

  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState){
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller){
        return Scaffold(
          backgroundColor: Color(0xFFeee7d7),
          appBar: AppBar(backgroundColor: Color(0xFFeee7d7),),
          drawer: DrawerWidget(),
          body: ListView(
            children:[ Center(
              child: Column(
                children: [
                  Text('Poema del día', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 36),),
                  SizedBox(height: 20,),
                  Image(image: AssetImage('images/art.jpg'), width: 250, height: 200,),
                  SizedBox(height: 30,),
                  Text('exceptio xviii', style: TextStyle(fontFamily: 'ebgaramont',fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                  SizedBox(height: 20,),
                  Text('Dejé de desperdiciar mis', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                  Text('lágrimas en pañuelos para', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                  Text('derramarlas en pergaminos y', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                  Text('volverlas poesía', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return PoemIndex();
                        }));
                      },
                      child: Text("Leer otros poemas", style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
