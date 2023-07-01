// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../mycadastro_page/gerenciar_cadastros.dart';
import '../main.dart';
import '../firebase/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdicionarCadastro extends StatelessWidget {
  AdicionarCadastro({super.key});

  //final storageRef = FirebaseStorage.instance.ref();
  final storageRef = FirebaseStorage.instance.ref('cadastro/');
//final FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              accountName: const Text(
                "Leonardo Zaniboni SIlva",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              accountEmail: const Text(
                "leonardo@usp.br",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/leo.png?alt=media&token=a1af14e8-69ac-4357-ad93-17c82e4c8405'),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Portaria'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return FirstPage();
                }));
              },
            ),
            ListTile(
              title: const Text('Cadastros'),
              leading: const Icon(
                Icons.contacts,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return GerenciarCadastros();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
              ),
              title: const Text('Desenvolvedores'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return GerenciarCadastros();
                }));
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Image.asset("assets/images/agoravai.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center),
        Center(
            child: Card(
                elevation: 20,
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.add_a_photo, size: 30.0),
                            const SizedBox(width: 10),
                            const Text(
                              ' Novo cadastro',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                height: 2,
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        // ignore: prefer_const_constructors
                        TextField(
                          autofocus: true,
                          controller: nameController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // ignore: prefer_const_constructors
                              icon: Icon(Icons.person),
                              hintText: 'Informe o nome completo'),
                        ),
                        TextField(
                          autofocus: true,
                          controller: dataController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // ignore: prefer_const_constructors
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

                              // ignore: use_build_context_synchronously
                              showDialog<void>(
                                context: context,
                                //barrierDismissible: false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('Carregando a imagem...'),
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              //backgroundColor: Colors.green,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
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
                            }
                          },
                        ),
                      ],
                    ))))
      ]),
    ));
  }
}

class Picture {
  late String name;
  late String link;
}
