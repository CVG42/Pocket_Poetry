import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  int numero = 0;
  Color texto = Colors.black;
  double fuente = 200;

  cambiar(opcion)
  {
    if(opcion==2)
      {
        setState(() {
          numero++;
        });
      }
    else if(opcion==1)
      {
        setState(() {
          numero--;
        });
      }

    if(numero <= -10)
      {
        setState(() {
          texto = Colors.red;
          fuente = 150;
        });
      }
    else if(numero >= 10)
      {
        texto = Colors.blue;
        fuente = 250;
      }
    else if(numero >= -9 && numero <=9)
      {
        texto = Colors.black;
        fuente = 200;
      }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/space.jpg'),
          //fit: BoxFit.cover
          //repeat: ImageRepeat.repeat
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        //backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Contador'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:50, bottom:40),
          child: Column(
            children: [
              //SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        cambiar(1);
                      },
                      child: Text('-', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                      backgroundColor: Colors.blue,
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      cambiar(2);
                    },
                    child: Text('+', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                        backgroundColor: Colors.blue,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Text(numero.toString(), style: TextStyle(fontSize: fuente, fontWeight: FontWeight.bold, color: texto),)
            ],
          ),
        )
      ),
    );
  }
}

