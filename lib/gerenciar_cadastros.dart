import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/main.dart';
import 'package:sel0373/show_img.dart';

class GerenciarCadastros extends StatelessWidget {
  GerenciarCadastros({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
      body: Stack(
        children: [
          Image.asset("assets/images/agoravai.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center),
          Center(
              child: Column(children: [
            // ignore: prefer_const_constructors
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.contacts, size: 30.0),
                const SizedBox(width: 10),
                const Text(
                  'Meus Cadastros',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    height: 2,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Card(
                    elevation: 10,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            )),
                        child: UserInformation())),
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
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 215, 112, 105),
                        elevation: 20,
                        shadowColor: Colors.red,
                      ),
                      // ignore: sort_child_properrties_last
                      child: const Text(
                        'Remover cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _negaAcesso();
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
}
