import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';

class AuthorAbout extends StatefulWidget {
  const AuthorAbout({super.key});

  @override
  State<AuthorAbout> createState() => _AuthorAboutState();
}

class _AuthorAboutState extends State<AuthorAbout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeee7d7),
      appBar: AppBar(backgroundColor: Color(0xFFeee7d7),),
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Daniela Padilla', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                      'Soy Daniela Padilla, me apasiona la poesía y este espacio está dedicado a mis poemas en conjunto con mi blog personal, El Beso de Caifás. Aquí se publicarán poemas exlusivos cortos.',
                    style: TextStyle(fontFamily: 'ebgaramont', fontSize: 20,),
                  ),
                ),
              ),
              Text('¡Gracias!', style: TextStyle(fontFamily: 'ebgaramont', fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(100), // Image radius
                  child: Image.asset('images/art4.jpg', fit: BoxFit.cover),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
