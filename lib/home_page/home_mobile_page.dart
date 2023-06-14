// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'last_picture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeMobilePage extends StatelessWidget {
  HomeMobilePage({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;
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
    return Column(children: [
      // SizedBox(
      //   height: 8,
      // ),
      // Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     // ignore: prefer_const_literals_to_create_immutables
      //     children: [
      //       const Icon(Icons.home, size: 30.0),
      //       const Text('Foto da portaria',
      //           style: TextStyle(
      //             decoration: TextDecoration.none,
      //             //height: 2,
      //             fontSize: 30,
      //             color: Colors.black,
      //           ))
      //     ]),
      // SizedBox(
      //   height: 8,
      // ),
      //Card(
      //   color: Colors.white.withOpacity(0.3),
      //   elevation: 10,
      //child:
      Container(
          //color: Colors.white.withOpacity(0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                //bottomLeft: Radius.circular(40),
                //bottomRight: Radius.circular(40),
              )),
          child: Column(children: <Widget>[
            SizedBox(
              height: 15,
            ),
            const Text('Uma pessoa deseja entrar no prédio.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  //height: 2,
                  fontSize: 15,
                  color: Colors.black,
                )),
            SizedBox(
              height: 15,
            ),
            // ignore: prefer_const_constructors
            //SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(80), // Image radius
                  child: LastPicture(),
                ),
              ),
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width * 0.5,
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   child: LastPicture(),
            // ),
            //       decoration : BoxDecoration(
            //         image: DecorationImage(
            // fit: BoxFit.cover, image: LastPicture()),
            //       //color: Colors.white.withOpacity(0.5),
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(40),
            //         topRight: Radius.circular(40),
            //         bottomLeft: Radius.circular(40),
            //         bottomRight: Radius.circular(40),

            //       )),),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(40), // Image border
            //     child: SizedBox.fromSize(
            //       size: Size.fromRadius(48), // Image radius
            //       child: LastPicture(),
            //     ),
            //   ),
            // ),

            // Container(
            //   width: MediaQuery.of(context).size.width * 0.5,
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   child: LastPicture(),
            // ),
            SizedBox(
              height: 20,
            ),
            Text('Deseja liberar a entrada?',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  //height: 2,
                  fontSize: 15,
                  color: Colors.black,
                )),

            SizedBox(
              height: 20,
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        'Liberar acesso',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _permiteAcesso();
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 215, 112, 105),
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
                  ],
                )),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 4,
            )
            //const SizedBox(height: 30)
          ])) //)
    ]);
  }
}
