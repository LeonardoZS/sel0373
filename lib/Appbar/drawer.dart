// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/Appbar/drawer.dart';
import 'package:sel0373/devs/dev.dart';
import 'package:sel0373/home_page/homepage.dart';
import '../history/history.dart';
import '../mycadastro_page/gerenciar_cadastros.dart';
import 'package:flutter/material.dart';

class DrawerTemplate extends StatefulWidget {
  DrawerTemplate({super.key});

  @override
  State<DrawerTemplate> createState() => _DrawerTemplateState();
}

class _DrawerTemplateState extends State<DrawerTemplate> {
  late String nome;
  late String foto;
  late String email;

  Future<bool> getCampoDoDocumento() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? user = auth.currentUser?.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot snapshot =
        await firestore.collection('admins').doc(user as String?).get();

    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;

    // Verifica se o documento existe
    if (snapshot.exists) {
      nome = map['nome'];
      foto = map['foto'];
      email = map['email'];
    } else {}

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: getCampoDoDocumento(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                // ignore: prefer_const_constructors
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 149, 228, 167),
                  ),
                  accountName: Text(
                    nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: Text(
                    email,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(foto),
                    backgroundColor: Colors.white,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                  title: const Text('Portaria'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return HomePage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Cadastros'),
                  leading: const Icon(Icons.contacts, color: Colors.green),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return GerenciarCadastros();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people, color: Colors.green),
                  title: const Text('Desenvolvedores'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return Developers();
                    }));
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.history, color: Colors.green),
                  title: const Text('Histórico'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return History();
                    }));
                  },
                ),
              ],
            );
          }

          return Center(
              child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  )));
        });
  }
}
