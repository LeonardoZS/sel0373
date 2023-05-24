import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:sel0373/webpage.dart';
import 'package:sel0373/webteste.dart';
import 'authentication.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:sel0373/gerenciar_cadastros.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Authentication());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Leonardo  Silva",
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
                // Update the state of the app.
                // ...
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
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/agoravai.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center),
      //Positioned.fill(
      //child: BackdropFilter(
      //filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      //child: const SizedBox(),
      //)
      //),
      //Responsive(mobile: MobilePage(), desktop: WebPage()),
      WebTeste(),
      //const WebPage(),
    ]);
  }
}
