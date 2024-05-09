import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'), backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              autocorrect: true,
              textCapitalization: TextCapitalization.words,
              //textAlign: TextAlign.center,
              obscureText: false,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              cursorColor: Colors.red,
              maxLength: 10,
              decoration: InputDecoration(
                //icon: Icon(Icons.person, color: Colors.blue)
                prefixIcon: Icon(Icons.person, color: Colors.blue,),
                //prefix: Image.asset('images/chew.png', width: 40,),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                hintText: 'Usuario',
                hintStyle: TextStyle(color: Colors.grey),
                helperText: 'Nombre de usuario',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow,
                    width: 2
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
