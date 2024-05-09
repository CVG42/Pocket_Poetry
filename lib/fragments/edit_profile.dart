import 'package:flutter/material.dart';
import 'package:zap653/DrawerWidget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:zap653/fragments/ProfileScreen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  File? image = null; //Es igual que File? image
  final ImagePicker picker = ImagePicker();

  var emailCtrl = TextEditingController();
  var nameCtrl = TextEditingController();

  Future cortar(picked) async {
    CroppedFile? cortado = await ImageCropper().cropImage(
        sourcePath: picked.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
    );
    if(cortado != null){
      setState(() {
        image = File(cortado.path);
      });
    }
  }

  Future seleccionar_imagen(op) async {
    var pickedFile;
    if(op == 1){
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }else{
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if(pickedFile != null){
        //image = File(pickedFile.path);
        cortar(File(pickedFile.path));
      }
    });
  }

  seleccionar(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      seleccionar_imagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Tomar una foto', style: TextStyle(fontSize: 16),)),
                          Icon(Icons.camera_alt, color: Colors.blue,),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      seleccionar_imagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(child: Text('Tomar de galeria', style: TextStyle(fontSize: 16),)),
                          Icon(Icons.image, color: Colors.blue,),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){Navigator.of(context).pop();},
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Cancelar', style: TextStyle(color: Colors.white),),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar perfil"), backgroundColor: Color(0xFFeee7d7),),
      drawer: DrawerWidget(),
      backgroundColor: Color(0xFFeee7d7),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text('Escribe tu nombre', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                controller: nameCtrl,
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
              SizedBox(height: 20,),
              Text('Escribe tu nuevo email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                controller: emailCtrl,
                cursorColor: Colors.blueAccent,
                obscureText: true,
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
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    seleccionar();
                  },
                  child: Text('Tomar foto')
              ),
              SizedBox(height: 20,),
              image == null ? Center() : Image.file(image!),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return ProfileScreen();
                    }));
                  },
                  child: Text('Guardar')
              ),
            ],
          )
      ),
    );
  }
}
