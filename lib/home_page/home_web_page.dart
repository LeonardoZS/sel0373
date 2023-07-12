// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sel0373/history/history_last_information.dart';
import 'last_picture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeWebPage extends StatelessWidget {
  late String reconhecimentoCount;
  late String cadastrosCount;

  HomeWebPage({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseFirestore firestoredata = FirebaseFirestore.instance;
  late String qtdCadastro;
  // final String qtdReconhecimento = '0';

  void _permiteAcesso() {
    final washingtonRef = db.collection("video").doc("pessoa");
    washingtonRef.update({"flag": "1"});
  }

  void _negaAcesso() {
    final washingtonRef = db.collection("video").doc("pessoa");
    washingtonRef.update({"flag": "2"});
  }

  // Future<String> _qtdCadastros() async {
  //   CollectionReference collectionRef = firestoredata.collection('cadastros');
  //   QuerySnapshot querySnapshot = await collectionRef.get();
  //   int quantidadeDocumentos = querySnapshot.size;
  //   return quantidadeDocumentos as String;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 15,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 100,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: Text(
                'Status',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Text(
                  'Sem requisições de entrada no momento',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    //fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Center(
              child: Text('Histórico Parcial',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 18,
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Center(
                child: Text('Estatísticas',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18,
                      //fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ))),
          )
        ],
      ),
      Expanded(
          child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            color: Color.fromARGB(255, 231, 234, 249),
            child: Center(child: HistoryLastInformation()),
          ),
          //Expanded(child: Container(color: Colors.black, child: Column()))
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firestoredata.collection('video').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          reconhecimentoCount =
                              snapshot.data!.docs.length.toString();
                        } else {
                          reconhecimentoCount = '0';
                        }

                        return Container(
                          color: Color.fromARGB(255, 149, 228, 167),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // SizedBox(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.02),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                                  height: 100,
                                  width: 100,
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
                                  )),
                              // SizedBox(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.07),
                              Text(
                                'Acessos\npermitidos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firestoredata.collection('cadastros').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          cadastrosCount =
                              (snapshot.data!.docs.length).toString();
                        } else {
                          cadastrosCount = '0';
                        }

                        return Container(
                          color: Color.fromARGB(255, 185, 191, 244),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // SizedBox(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.02),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      cadastrosCount,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color:
                                            Color.fromARGB(255, 109, 70, 235),
                                      ),
                                    ),
                                  )),
                              // SizedBox(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.07),
                              Text(
                                'Usuários\ncadastrados',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }))
            ],
          ))
        ],
      )),
    ]);
  }
}
