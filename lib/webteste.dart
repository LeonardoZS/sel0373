import 'package:sel0373/gerenciar_cadastros.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:flutter/material.dart';

import 'last_picture.dart';

class WebTeste extends StatelessWidget {
  WebTeste({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;
  //final washingtonRef = null;

  void _permiteAcesso() {
    final washingtonRef = db.collection("video").doc("pessoa");
    washingtonRef.update({"flag": "1"});
  }

  void _negaAcesso() {
    final washingtonRef = db.collection("video").doc("pessoa");
    washingtonRef.update({"flag": "2"});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.home, size: 30.0),
            SizedBox(width: 10),
            const Text('Foto da portaria',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  height: 2,
                  fontSize: 30,
                  color: Colors.black,
                ))
          ]),
      Card(
          elevation: 10,
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              //width: MediaQuery.of(context).size.width * 0.9,
              //height: MediaQuery.of(contextr).size.height * 0.9,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Column(children: <Widget>[
                // ignore: prefer_const_constructors
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 500,
                        height: 500,
                        child: LastPicture(),
                      ),
                    ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 114, 176, 116),
                                elevation: 20,
                                shadowColor: Color.fromARGB(255, 186, 247, 117),
                              ),
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Liberar acesso',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                _permiteAcesso();
                              },
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 215, 112, 105),
                                elevation: 20,
                                shadowColor: Colors.red,
                              ),
                              // ignore: sort_child_properrties_last
                              child: const Text(
                                'Negar acesso',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                _negaAcesso();
                              },
                            )

                            // ignore: prefer_const_constructors
                            // Text('Liberar acesso:',
                            //     // ignore: prefer_const_constructors
                            //     style: TextStyle(
                            //       decoration: TextDecoration.underline,
                            //       height: 2,
                            //       fontSize: 30,
                            //       color: Colors.black,
                            //     )),
                            // IconButton(
                            //   iconSize: 40,
                            //   color: Colors.green,
                            //   icon: const Icon(Icons.check),
                            //   onPressed: () {
                            //     // ...
                            //   },
                            // ),
                            // IconButton(
                            //   iconSize: 40,
                            //   color: Colors.red,
                            //   icon: const Icon(Icons.close),
                            //   onPressed: () {
                            //     // ...
                            //   },
                            // ),
                          ],
                        ))),
                const SizedBox(height: 30)
              ])))
    ]));
  }
}
