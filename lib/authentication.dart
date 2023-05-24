// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:sel0373/main.dart';
import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:sel0373/webpage.dart';
import 'package:sel0373/webteste.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:sel0373/gerenciar_cadastros.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthenticationPage());
  }
}

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({super.key});

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  int flag = 0;
  // a flag 0 refere-se ao estado inicial.
  // a flag 1 refere-se ao estado quando o login é aceitado
  // a flag 2 refere-se ao estado quando o login é declinado
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(
        //  title: const Text('Home'),
        //),
        body: Stack(
          children: [
            Image.asset("assets/images/agoravai.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.center),
            Center(
                child: Card(
              elevation: 15,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            child: Image.asset("assets/images/alou.png",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.center)),
                        Text(
                          '  ---- Porteiro Eletrônico SEL0373',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextField(
                        autofocus: true,
                        controller: EmailController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.email),
                            hintText: 'Insira o Email de Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: TextField(
                        autofocus: true,
                        obscureText: true,
                        controller: PasswordController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.key),
                            hintText: 'Insira a senha'),
                      ),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 141, 242, 198),
                          elevation: 20,
                          shadowColor: Color.fromARGB(255, 168, 239, 203),
                        ),
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          _doLogin(
                              context, EmailController, PasswordController);
                        })
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future _doLogin(
  BuildContext context,
  TextEditingController EmailController,
  TextEditingController PasswordController,
) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: EmailController.text,
      password: PasswordController.text,
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return FirstPage();
    }));
    print('Login realizado com sucesso');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
