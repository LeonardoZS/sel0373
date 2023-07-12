// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server.dart';

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
              bottom: Radius.circular(0),
            ),
          ),
          title: Text(
            'Desenvolvedores',
            style: TextStyle(
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
        child: DrawerTemplate(),
      ),
      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 20),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(80), // Image radius
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fleo.png?alt=media&token=404d5019-ef0d-4d7f-8c91-217c76d7baa4',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    'Mobile/Web',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
              ),
              SizedBox(height: 40),
              Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(80), // Image radius
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fgabs.jpg?alt=media&token=9252f562-ad3a-4850-b5dc-74a601c56e86',
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'Embarcados',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 9, 21, 155),
                  ),
                ),
                Text(
                  'Nome: Gabriel Domingues',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Nusp :  11800903',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ]),
              SizedBox(height: 40),
              Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(80), // Image radius
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FBRUNO.jpg?alt=media&token=2050367d-6c29-48f3-8e0c-b5d73c46c861',
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'Embarcados',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 9, 21, 155),
                  ),
                ),
                Text(
                  'Nome: Bruno Paiva Santanna',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Nusp : 118190507',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    )
        //])
        );
  }
}

class DevsWebPage extends StatelessWidget {
  const DevsWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          title: Text(
            'Desenvolvedores',
            style: TextStyle(
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
        child: DrawerTemplate(),
      ),
      backgroundColor: Colors.white,

      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 20),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(120), // Image radius
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fleo.png?alt=media&token=404d5019-ef0d-4d7f-8c91-217c76d7baa4',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // CircleAvatar(
                    //   radius: 150.0,
                    //   backgroundImage: NetworkImage(
                    //       'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fleo.png?alt=media&token=404d5019-ef0d-4d7f-8c91-217c76d7baa4'),
                    //   backgroundColor: Colors.white,
                    // ),
                    Text(
                      'Mobile/Web',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 9, 21, 155),
                      ),
                    ),
                    Text(
                      'Nome: Leonardo Zaniboni SIlva',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Nusp : 11801049',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                //color: Color.fromARGB(255, 206, 236, 220),
                child: Column(children: [
                  SizedBox(
                    height: 15,
                  ),
                  // CircleAvatar(
                  //   radius: 150.0,
                  //   backgroundImage: NetworkImage(
                  //       'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FCaptura%20de%20tela%20de%202023-06-14%2013-03-30.png?alt=media&token=9b5cd2bf-88fb-46da-b7bf-17bb72f7d7f7'),
                  //   backgroundColor: Colors.white,
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(120), // Image radius
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2Fgabs.jpg?alt=media&token=9252f562-ad3a-4850-b5dc-74a601c56e86',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Embarcados',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 9, 21, 155),
                    ),
                  ),
                  Text(
                    'Nome: Gabriel Domingues',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Nusp : 11800903',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(120), // Image radius
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FBRUNO.jpg?alt=media&token=2050367d-6c29-48f3-8e0c-b5d73c46c861',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // CircleAvatar(
                  //   radius: 150.0,
                  //   backgroundImage: NetworkImage(
                  //       'https://firebasestorage.googleapis.com/v0/b/porteiroeletronico-sel0373.appspot.com/o/devs%2FCaptura%20de%20tela%20de%202023-06-14%2013-03-47.png?alt=media&token=13328fa8-62e2-4afe-a86a-ef44f370f6e4'),
                  //   backgroundColor: Colors.white,
                  // ),
                  Text(
                    'Embarcados',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 9, 21, 155),
                    ),
                  ),
                  Text(
                    'Nome: Bruno Paiva Santanna',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Nusp : 118190507',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    )
        //])
        );
  }
}
