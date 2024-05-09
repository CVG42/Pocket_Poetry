import 'package:flutter/material.dart';
import 'package:zap653/fotos.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {

  var usuario;
  Menu(this.usuario,{super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF398AE5),
            ),
            accountName: Text(widget.usuario, style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
            accountEmail: Text('zap653@amerike.edu.mx', style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
            currentAccountPicture: Image.asset('images/chew.png'),
          ),
          ListTile(
            onTap: (){},
            title: Text('Perfil', style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
            leading: Icon(Icons.person),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Fotos();
              }));
            },
            title: Text('Agregar medicamento', style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
            leading: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
