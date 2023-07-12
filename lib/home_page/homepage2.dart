// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'last_picture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeMobilePage extends StatelessWidget {
  HomeMobilePage({super.key});

  late String reconhecimentoCount;
  late String cadastrosCount;

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
    var altura =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return Column(children: [
      Container(
          //color: Colors.white.withOpacity(0.3),
          width: MediaQuery.of(context).size.width,
          height: altura,
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(40),
          //       topRight: Radius.circular(40),
          //       //bottomLeft: Radius.circular(40),
          //       //bottomRight: Radius.circular(40),
          //     )),
          child: Column(children: <Widget>[
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
              height: altura / 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: altura / 8,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 254, 213),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 2, 180, 94),
                          child: Text(
                            'ON',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )),
                      Center(
                        child: Text(
                          'Sem requisições de entrada\nno momento',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: altura / 32),

            //Container(
            //height: altura / 32,
            // child: Row(
            //   // ignore: prefer_const_literals_to_create_immutables
            //   children: [
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.05,
            //     ),
            //     Icon(
            //       Icons.poll,
            //       color: Colors.black,
            //       weight: 26,
            //     ),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.05,
            //     ),
            //     Text(
            //       'Estatística de uso',
            //       style: TextStyle(
            //         decoration: TextDecoration.none,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 26,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // )),
            SizedBox(height: altura / 32),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 185, 191, 244),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  StreamBuilder<QuerySnapshot>(
                      stream: db.collection('cadastros').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          cadastrosCount =
                              snapshot.data!.docs.length.toString();
                        } else {
                          cadastrosCount = '0';
                        }
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            height: altura / 8,
                            width: altura / 8,
                            child: Center(
                              child: Text(
                                cadastrosCount,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 42, 58, 204),
                                ),
                              ),
                            ));
                      }),
                  //SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  Container(
                    width: 175,
                    child: Text(
                      'Usuários\ncadastrados',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )),

            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 226, 254, 213),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  StreamBuilder<QuerySnapshot>(
                      stream: db.collection('video').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          reconhecimentoCount =
                              snapshot.data!.docs.length.toString();
                        } else {
                          reconhecimentoCount = '0';
                        }

                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            height: altura / 8,
                            width: altura / 8,
                            child: Center(
                              child: Text(
                                reconhecimentoCount,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 48, 123, 13),
                                ),
                              ),
                            ));
                      }),
                  //SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                  Container(
                    width: 175,
                    child: Text(
                      'Acessos\npermitidos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )),

            // Expanded(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     color: Color.fromARGB(255, 255, 184, 188),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         SizedBox(width: MediaQuery.of(context).size.width * 0.07),
            //         Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(10),
            //                   topRight: Radius.circular(10),
            //                   bottomLeft: Radius.circular(10),
            //                   bottomRight: Radius.circular(10),
            //                 )),
            //             height: altura / 8,
            //             width: altura / 8,
            //             child: Center(
            //               child: Text(
            //                 '3',
            //                 style: TextStyle(
            //                   decoration: TextDecoration.none,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 30,
            //                   color: Color.fromARGB(255, 143, 19, 25),
            //                 ),
            //               ),
            //             )),
            //         SizedBox(width: MediaQuery.of(context).size.width * 0.07),
            //         Text(
            //           'Reconhecimentos\nnegados',
            //           style: TextStyle(
            //             decoration: TextDecoration.none,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 25,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )

            // Text('Deseja liberar a entrada?',
            //     maxLines: 3,
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //       decoration: TextDecoration.none,
            //       fontWeight: FontWeight.bold,
            //       //height: 2,
            //       fontSize: 15,
            //       color: Colors.black,
            //     )),

            // SizedBox(
            //   height: 20,
            // ),

            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         TextButton(
            //           style: TextButton.styleFrom(
            //             backgroundColor: Color.fromARGB(255, 114, 176, 116),
            //             elevation: 20,
            //             shadowColor: Color.fromARGB(255, 186, 247, 117),
            //           ),
            //           // ignore: sort_child_properties_last
            //           child: const Text(
            //             'Liberar acesso',
            //             style: TextStyle(
            //               color: Colors.black,
            //             ),
            //           ),
            //           onPressed: () {
            //             _permiteAcesso();
            //           },
            //         ),
            //         const SizedBox(width: 10),
            //         TextButton(
            //           style: TextButton.styleFrom(
            //             backgroundColor: Color.fromARGB(255, 215, 112, 105),
            //             elevation: 20,
            //             shadowColor: Colors.red,
            //           ),
            //           // ignore: sort_child_properrties_last
            //           child: const Text(
            //             'Negar acesso',
            //             style: TextStyle(
            //               color: Colors.black,
            //             ),
            //           ),
            //           onPressed: () {
            //             _negaAcesso();
            //           },
            //         )
            //       ],
            //     )),
            // SizedBox(
            //   height: 8,
            // ),
            // Divider(
            //   height: 4,
            // )
            //const SizedBox(height: 30)
          ])) //)
    ]);
  }
}
