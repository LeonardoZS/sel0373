// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Appbar/drawer.dart';
import '../responsive.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: DevsMobilePage(), desktop: DevsWebPage());
  }
}

class DevsMobilePage extends StatelessWidget {
  const DevsMobilePage({super.key});

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
                  'Desenvolvedores',
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
              child: DrawerTemplate(),
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Expanded(
                      child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fleo.png?alt=media&token=404d5019-ef0d-4d7f-8c91-217c76d7baa4'),
                        backgroundColor: Colors.white,
                      ),
                      Text(
                        'Mobile/Web',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 9, 21, 155),
                        ),
                      ),
                      Text(
                        'Nome: Leonardo Zaniboni SIlva',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Nusp : 11801049',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FCaptura%20de%20tela%20de%202023-06-14%2013-03-30.png?alt=media&token=9b5cd2bf-88fb-46da-b7bf-17bb72f7d7f7'),
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      'Mobile/Web',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 9, 21, 155),
                      ),
                    ),
                    Text(
                      'Nome: Leonardo Zaniboni SIlva',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Nusp : 11801049',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ])),
                  Expanded(
                      child: Column(children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FCaptura%20de%20tela%20de%202023-06-14%2013-03-47.png?alt=media&token=13328fa8-62e2-4afe-a86a-ef44f370f6e4'),
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      'Embarcados',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 9, 21, 155),
                      ),
                    ),
                    Text(
                      'Nome: Leonardo Zaniboni SIlva',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Nusp : 11801049',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ]))
                ],
              ),
            )
            //])
            ));
  }
}

class DevsWebPage extends StatelessWidget {
  const DevsWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
