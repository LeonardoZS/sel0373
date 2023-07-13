// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/main.dart';
import 'package:sel0373/mycadastro_page/show_img.dart';
import 'package:sel0373/utilitys/adicionar_cadastros.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as IMG;

import '../Appbar/drawer.dart';

class GerenciarCadastros extends StatefulWidget {
  GerenciarCadastros({super.key});

  @override
  State<GerenciarCadastros> createState() => _GerenciarCadastrosState();
}

class _GerenciarCadastrosState extends State<GerenciarCadastros> {
  final TextEditingController attController = TextEditingController();
  String _displayText = '';

  // void _updateDisplayText() {
  //   setState(() {
  //     _displayText = '';
  //   });
  // }

  void initState() {
    super.initState();
    //attController.addListener(_updateDisplayText);
  }

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
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 149, 228, 167),
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

                        if (MediaQuery.of(context).size.width > 992) {
                          _dialogBuilderWeb(
                              context,
                              storageRef,
                              nameController,
                              dataController,
                              emailController,
                              phoneController,
                              db,
                              link);
                        } else {
                          _dialogBuilder(
                              context,
                              storageRef,
                              nameController,
                              dataController,
                              emailController,
                              phoneController,
                              db,
                              link);
                        }

                        //    Navigator.push(
                        //        context,
                        //        MaterialPageRoute(
                        //            builder: (context) => AdicionarCadastro()));
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 236, 72, 72),
                        elevation: 20,
                        shadowColor: Color.fromARGB(255, 186, 247, 117),
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Remover Cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        if (MediaQuery.of(context).size.width > 992) {
                          RemoveWeb(context);
                        } else {
                          RemoveMobile(context);
                        }
                      },
                    )
                  ],
                )
              ],
            )
          ])),
        ],
      ),
    ));
  }

  Future<dynamic> RemoveMobile(BuildContext context) {
    Map<String, dynamic> data;
    final storageRef = FirebaseStorage.instance;
    final Map<String, dynamic> dataupdate;
    String link;
    return showDialog(
      context: context,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                  child: Text('Remoçao de Usuário',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              actions: <Widget>[
                // ignore: prefer_const_constructors
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Digite o nome do usuário'),
                        TextField(
                          autofocus: true,
                          controller: attController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                              hintText: 'Nome do usuário'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  // backgroundColor: Color.fromARGB(255, 240, 217, 218),
                                  // elevation: 20,
                                  // shadowColor: Color.fromARGB(255, 243, 214, 214),
                                  ),
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                _displayText = '';
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 243, 175, 177),
                                elevation: 20,
                                shadowColor: Color.fromARGB(255, 234, 158, 158),
                              ),
                              child: const Text(
                                'Remover',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                db
                                    .collection("cadastros")
                                    .doc(attController.text)
                                    .get()
                                    .then((docSnapshot) async => {
                                          if (docSnapshot.exists)
                                            {
                                              data = docSnapshot.data()!,
                                              link = data['foto'],
                                              await storageRef
                                                  .ref()
                                                  .child(link)
                                                  .delete(),
                                              await db
                                                  .collection('token_cadastro')
                                                  .doc('nome_pessoa')
                                                  .update({
                                                "filename": attController.text
                                              }),
                                              db
                                                  .collection('token_cadastro')
                                                  .doc('token_cadastro')
                                                  .update({"token": '2'}),
                                              db
                                                  .collection("cadastros")
                                                  .doc(attController.text)
                                                  .delete(),
                                              Navigator.of(context).pop()
                                            }
                                          else
                                            {
                                              setState(() {
                                                _displayText =
                                                    'Usuário não encontrado!';
                                              }),
                                            }
                                        });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            _displayText,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  Future<dynamic> RemoveWeb(BuildContext context) {
    Map<String, dynamic> data;
    final storageRef = FirebaseStorage.instance;
    final Map<String, dynamic> dataupdate;
    // final desertRef = storageRef.child("cadastro/");
    String link;
    return showDialog(
      context: context,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                  child: Text('Remoçao de Usuário',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              actions: <Widget>[
                // ignore: prefer_const_constructors
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Digite o nome do usuário'),
                        TextField(
                          autofocus: true,
                          controller: attController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                              hintText: 'Nome do usuário'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  // backgroundColor: Color.fromARGB(255, 240, 217, 218),
                                  // elevation: 20,
                                  // shadowColor: Color.fromARGB(255, 243, 214, 214),
                                  ),
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                _displayText = '';
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 243, 175, 177),
                                elevation: 20,
                                shadowColor: Color.fromARGB(255, 234, 158, 158),
                              ),
                              child: const Text(
                                'Remover',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                db
                                    .collection("cadastros")
                                    .doc(attController.text)
                                    .get()
                                    .then((docSnapshot) async => {
                                          if (docSnapshot.exists)
                                            {
                                              data = docSnapshot.data()!,
                                              link = data['foto'],
                                              await storageRef
                                                  .ref()
                                                  .child(link)
                                                  .delete(),
                                              await db
                                                  .collection('token_cadastro')
                                                  .doc('nome_pessoa')
                                                  .update({
                                                "filename": attController.text
                                              }),
                                              db
                                                  .collection('token_cadastro')
                                                  .doc('token_cadastro')
                                                  .update({"token": '2'}),
                                              db
                                                  .collection("cadastros")
                                                  .doc(attController.text)
                                                  .delete(),
                                              Navigator.of(context).pop()
                                            }
                                          else
                                            {
                                              setState(() {
                                                _displayText =
                                                    'Usuário não encontrado!';
                                              }),
                                            }
                                        });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            _displayText,
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}

Future<void> _dialogBuilder(
  BuildContext context,
  Reference storageRef,
  TextEditingController nameController,
  TextEditingController rgController,
  TextEditingController cadastroController,
  TextEditingController apController,
  FirebaseFirestore db,
  String link,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text('Novo Cadastro',
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          // ignore: prefer_const_constructors

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextField(
                    autofocus: true,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        hintText: 'Nome completo'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: rgController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.contact_mail,
                          color: Colors.green,
                        ),
                        hintText: 'RG'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: apController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.door_front_door,
                          color: Colors.green,
                        ),
                        hintText: 'AP'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: cadastroController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.people,
                          color: Colors.green,
                        ),
                        hintText: 'Visitante ou Morador?'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 210, 246, 210),
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Carregar a imagem',
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

                          Uint8List? resizedData = fileBytes;
                          IMG.Image? img = IMG.decodeImage(resizedData!);
                          IMG.Image resized =
                              IMG.copyResize(img!, width: 600, height: 800);
                          resizedData = IMG.encodeJpg(resized);

                          showDialog<void>(
                            context: context,
                            //barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text('Carregando...'),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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

                          await storageRef.child(nameController.text).putData(
                              resizedData!,
                              SettableMetadata(
                                contentType: "image/jpeg",
                              ));

                          Navigator.of(context, rootNavigator: true).pop();

                          link = await storageRef
                              .child(nameController.text)
                              .getDownloadURL();
                        }
                      },
                    ),
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
                        child: const Text(
                          'Cancelar',
                          selectionColor: Colors.green,
                        ),
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

                          db
                              .collection('token_cadastro')
                              .doc('token_cadastro')
                              .update({"token": "1"});

                          final data = <String, String>{
                            "nome": nameController.text,
                            "foto": link,
                            "ap": apController.text,
                            "cadastro": cadastroController.text,
                            "rg": rgController.text,
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
          )
        ],
      );
    },
  );
}

Future<void> _dialogBuilderWeb(
  BuildContext context,
  Reference storageRef,
  TextEditingController nameController,
  TextEditingController rgController,
  TextEditingController cadastroController,
  TextEditingController apController,
  FirebaseFirestore db,
  String link,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text('Novo Cadastro',
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          // ignore: prefer_const_constructors

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextField(
                    autofocus: true,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        hintText: 'Nome completo'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: rgController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.contact_mail,
                          color: Colors.green,
                        ),
                        hintText: 'RG'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: apController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.door_front_door,
                          color: Colors.green,
                        ),
                        hintText: 'AP'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: cadastroController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.people,
                          color: Colors.green,
                        ),
                        hintText: 'Visitante ou Morador?'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 210, 246, 210),
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Carregar a imagem',
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

                          Uint8List? resizedData = fileBytes;
                          IMG.Image? img = IMG.decodeImage(resizedData!);
                          IMG.Image resized =
                              IMG.copyResize(img!, width: 600, height: 800);
                          resizedData = IMG.encodeJpg(resized);

                          showDialog<void>(
                            context: context,
                            //barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text('Carregando...'),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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

                          await storageRef.child(nameController.text).putData(
                              resizedData!,
                              SettableMetadata(
                                contentType: "image/jpeg",
                              ));

                          Navigator.of(context, rootNavigator: true).pop();

                          link = await storageRef
                              .child(nameController.text)
                              .getDownloadURL();
                        }
                      },
                    ),
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
                        child: const Text(
                          'Cancelar',
                          selectionColor: Colors.green,
                        ),
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

                          db
                              .collection('token_cadastro')
                              .doc('token_cadastro')
                              .update({"token": "1"});

                          final data = <String, String>{
                            "nome": nameController.text,
                            "foto": link,
                            "ap": apController.text,
                            "cadastro": cadastroController.text,
                            "rg": rgController.text,
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
          )
        ],
      );
    },
  );
}

Future _dialogRemove(
  BuildContext context,
  Reference storageRef,
  TextEditingController apController,
  FirebaseFirestore db,
  String link,
) {
  //apController.text = 'Null';
  String Texto = '';
  Future;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child: Text('Remoçao de Usuário',
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          // ignore: prefer_const_constructors
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Digite o nome da pessoa'),
                  TextField(
                    autofocus: true,
                    controller: apController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        hintText: 'Nome do usuário'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            // backgroundColor: Color.fromARGB(255, 240, 217, 218),
                            // elevation: 20,
                            // shadowColor: Color.fromARGB(255, 243, 214, 214),
                            ),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          print(apController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 243, 175, 177),
                          elevation: 20,
                          shadowColor: Color.fromARGB(255, 234, 158, 158),
                        ),
                        child: const Text(
                          'Remover',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          db
                              .collection("DELETETESTE")
                              .doc(apController.text)
                              .get()
                              .then((docSnapshot) => {
                                    if (docSnapshot.exists)
                                      {
                                        db
                                            .collection("DELETETESTE")
                                            .doc(apController.text)
                                            .delete(),
                                        db
                                            .collection('token_cadastro')
                                            .doc('token_cadastro')
                                            .update({"token": "2"}),
                                        Navigator.of(context).pop()
                                      }
                                    else
                                      {
                                        Texto = 'Usuário não encontrado.',
                                        print(Texto)
                                      }
                                  });

                          // db
                          //     .collection("DELETETESTE")
                          //     .doc(apController.text)
                          //     .delete();

                          // db
                          //     .collection('token_cadastro')
                          //     .doc('token_cadastro')
                          //     .update({"token": "1"});

                          // final data = <String, String>{
                          //   "nome": nameController.text,
                          //   "foto": link,
                          //   "ap": apController.text,
                          //   "cadastro": cadastroController.text,
                          //   "rg": rgController.text,
                          // };
                          // db
                          //     .collection("cadastros")
                          //     .doc(nameController.text)
                          //     .set(data, SetOptions(merge: true));
                        },
                      ),
                    ],
                  ),
                  Text(
                    Texto,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          )
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