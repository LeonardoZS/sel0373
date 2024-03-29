// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sel0373/main.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Responsive(
            mobile: AuthenticationMobilePage(),
            desktop: AuthenticationWebPage()));
  }
}

class AuthenticationMobilePage extends StatelessWidget {
  AuthenticationMobilePage({super.key});

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 149, 228, 167),
        body: Stack(
          children: [
            Center(
                child: Card(
              color: Colors.white.withOpacity(0.9),
              elevation: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 150,
                        height: 150,
                        child: Image.asset("assets/images/logo.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.center)),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        autofocus: true,
                        controller: EmailController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.green), //<-- SEE HERE
                            ),

                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.email, color: Colors.green),
                            hintText: 'Insira o Email de Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        autofocus: true,
                        obscureText: true,
                        controller: PasswordController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.green), //<-- SEE HERE
                            ),
                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.key, color: Colors.green),
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

class AuthenticationWebPage extends StatelessWidget {
  const AuthenticationWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 149, 228, 167),
            body: Stack(children: [
              Center(
                  child: Card(
                      color: Colors.white.withOpacity(0.9),
                      elevation: 20,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 300,
                                  height: 250,
                                  child: Image.asset("assets/images/logo.png",
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center)),
                              // FittedBox(
                              //     child: Text(' Seja bem vindo(a)!',
                              //         style: TextStyle(
                              //           fontFamily: 'DMSans',
                              //           fontSize: 18,
                              //           fontStyle: FontStyle.italic,
                              //           fontWeight: FontWeight.bold,
                              //         ))),
                              LayoutBuilder(builder: (_, constraints) {
                                TextEditingController EmailController =
                                    TextEditingController();
                                TextEditingController PasswordController =
                                    TextEditingController();
                                return Container(
                                    width: constraints.maxWidth * 0.8,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: TextField(
                                            autofocus: true,
                                            controller: EmailController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 1,
                                                )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors
                                                          .green), //<-- SEE HERE
                                                ),

                                                // ignore: prefer_const_constructors
                                                icon: Icon(Icons.email,
                                                    color: Colors.green),
                                                hintText:
                                                    'Insira o Email de Login'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: TextField(
                                            autofocus: true,
                                            obscureText: true,
                                            controller: PasswordController,
                                            // ignore: prefer_const_constructors
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 1,
                                                )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors
                                                          .green), //<-- SEE HERE
                                                ),
                                                // ignore: prefer_const_constructors
                                                icon: Icon(Icons.key,
                                                    color: Colors.green),
                                                hintText: 'Insira a senha'),
                                          ),
                                        ),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 141, 242, 198),
                                              elevation: 20,
                                              shadowColor: Color.fromARGB(
                                                  255, 168, 239, 203),
                                            ),
                                            // ignore: sort_child_properties_last
                                            child: const Text(
                                              'Login',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            onPressed: () {
                                              _doLogin(context, EmailController,
                                                  PasswordController);
                                            })
                                      ],
                                    ));
                              })
                            ],
                          ))))
            ])));
  }
}

Future _doLogin(
  BuildContext context,
  TextEditingController EmailController,
  TextEditingController PasswordController,
) async {
  try {
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ],
            ));
      },
    );

    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: EmailController.text,
      password: PasswordController.text,
    );

    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return FirstPage();
    }));
    print('Login realizado com sucesso');
  } on FirebaseAuthException catch (e) {
    Navigator.of(context, rootNavigator: true).pop();
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Falha no login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Usuário/senha não encontrado'),
                Text('Por favor, tente novamente.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
