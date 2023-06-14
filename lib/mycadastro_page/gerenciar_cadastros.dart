// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/main.dart';
import 'package:sel0373/mycadastro_page/show_img.dart';
import 'package:sel0373/utilitys/adicionar_cadastros.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Appbar/drawer.dart';

class GerenciarCadastros extends StatelessWidget {
  GerenciarCadastros({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref('cadastro/');

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final String link = 'teste';

  void _permiteAcesso() {
    final washingtonRef = db.collection("Token").doc("token");
    washingtonRef.update({"token": "1"});
  }

  void _negaAcesso() {
    final washingtonRef = db.collection("Token").doc("token");
    washingtonRef.update({"token": "2"});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(
            'Meus Cadastros',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          backgroundColor: Colors.green,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: DrawerTemplate(),
      ),
      //backgroundColor: Color.fromARGB(255, 128, 168, 149),
      body: Stack(
        children: [
          // Image.asset("assets/images/blur.jpg",
          //     width: double.infinity,
          //     height: double.infinity,
          //     fit: BoxFit.cover,
          //     alignment: Alignment.center),
          Center(
              child: Column(children: [
            // ignore: prefer_const_constructors
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   // ignore: prefer_const_literals_to_create_immutables
            //   children: [
            //     const Icon(Icons.contacts, size: 30.0),
            //     const SizedBox(width: 10),
            //     const Text(
            //       'Meus Cadastros',
            //       style: TextStyle(
            //         decoration: TextDecoration.none,
            //         height: 2,
            //         fontSize: 30,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                //Card(
                //elevation: 10,

                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    // decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(40),
                    //       topRight: Radius.circular(40),
                    //       bottomLeft: Radius.circular(40),
                    //       bottomRight: Radius.circular(40),
                    //     )),
                    child: UserInformation()),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 114, 176, 116),
                        elevation: 20,
                        shadowColor: Color.fromARGB(255, 186, 247, 117),
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Adicionar cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _permiteAcesso();
                        _dialogBuilder(
                            context,
                            storageRef,
                            nameController,
                            dataController,
                            emailController,
                            phoneController,
                            db,
                            link);

                        //    Navigator.push(
                        //        context,
                        //        MaterialPageRoute(
                        //            builder: (context) => AdicionarCadastro()));
                      },
                    ),
                  ],
                )
              ],
            )
          ])),
        ],
      ),
    ));
  }
}

Future<void> _dialogBuilder(
  BuildContext context,
  Reference storageRef,
  TextEditingController nameController,
  TextEditingController dataController,
  TextEditingController emailController,
  TextEditingController phoneController,
  FirebaseFirestore db,
  String link,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        //title: const Text('Basic dialog title'),
        content: const Text('Insira abaixo os dados para um novo cadastro',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          // ignore: prefer_const_constructors

          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person),
                      hintText: 'Informe o nome completo'),
                ),
                TextField(
                  autofocus: true,
                  controller: dataController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.contact_mail),
                      hintText: 'Insira o RG'),
                ),
                TextField(
                  autofocus: true,
                  controller: emailController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // ignore: prefer_const_constructors
                      icon: Icon(Icons.email),
                      hintText: 'Insira o email'),
                ),
                TextField(
                  autofocus: true,
                  controller: phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.cell_tower),
                      hintText: 'Informe o telefone'),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 229, 230, 229),
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 214, 223, 203),
                  ),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Clique aqui para upar a imagem ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      Uint8List? fileBytes = result.files.first.bytes;
                      String fileName = result.files.first.name;

                      showDialog<void>(
                        context: context,
                        //barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Carregando...'),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      //backgroundColor: Colors.green,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );

                      await storageRef.child(fileName).putData(
                          fileBytes!,
                          SettableMetadata(
                            contentType: "image/jpeg",
                          ));

                      Navigator.of(context, rootNavigator: true).pop();

                      link = await storageRef.child(fileName).getDownloadURL();
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Cadastrar'),
                      onPressed: () {
                        Navigator.of(context).pop();

                        final data = <String, String>{
                          "nome": nameController.text,
                          "foto": link,
                        };
                        db
                            .collection("cadastros")
                            .doc(nameController.text)
                            .set(data, SetOptions(merge: true));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

class NewCadastro {
  late String name;
  late String link;
}




  // class ShowCadastro extends StatelessWidget {
  //   const ShowCadastro({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return   showDialog(
  //                           context: context,
  //                           builder: (BuildContext context) {
  //                             return AlertDialog(
  //                               title: new Text("Alert!!"),
  //                               content: new Text("You are awesome!"),
  //                               actions: ShowCadastro(),
  //                             );
  //                           },
  //                         );;
  //   }
  // }