//import 'dart:ui';
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';
import '../responsive.dart';

class HistoryInformation extends StatefulWidget {
  @override
  _HistoryInformationState createState() => _HistoryInformationState();
}

class _HistoryInformationState extends State<HistoryInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('video').snapshots();

  List<Picture> list = [];

  List<Widget> getList() {
    List<Widget> widgets = [];

    list.forEach((element) {
      widgets.add(ShowImage(picture: element));
      widgets.add(Divider(
        height: 2,
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        if (snapshot.hasData) {
          list = [];

          snapshot.data?.docs.forEach((element) {
            Picture picture = Picture();

            Map<String, dynamic> map = element.data() as Map<String, dynamic>;

            picture.name = map['nome'];
            picture.link = map['foto'];
            // picture.cadastro = map['cadastro'];
            // picture.ap = map['ap'];
            // picture.rg = map['rg'];
            picture.data = map['date'];
            picture.horario = map['time'];

            String ano = picture.data.substring(6, 10);
            String dia = picture.data.substring(0, 2);
            String mes = picture.data.substring(3, 5);
            String hora = picture.horario.substring(0, 2);
            String minuto = picture.horario.substring(3, 5);
            String segundo = picture.horario.substring(6, 8);

            String ordenado = ano + mes + dia + hora + minuto + segundo;
            picture.ordenado = int.parse(ordenado);
            print(picture.ordenado);

            //         list.forEach((element) {

            // });

            list.add(picture);

            list.sort((a, b) => b.ordenado.compareTo(a.ordenado));
          });
        }

        return Responsive(
            mobile: ListView(children: getList()),
            desktop: GridView.count(
                //primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: getList()));

        // GridView.count(
        //     //primary: false,
        //     padding: const EdgeInsets.all(20),
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     crossAxisCount: 4,
        //     children: getList());
      },
    );
  }
}

class Picture {
  late String name;
  late String link;
  late String cadastro;
  late String ap;
  late String rg;
  late String horario;
  late String data;
  late int ordenado;
}

class ShowImage extends StatelessWidget {
  final Picture picture;

  ShowImage({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Container(
          //width: 200,
          height: 220,
          //color: Colors.green[50],
          // decoration: BoxDecoration(
          //     //color: Colors.green[50],
          //     //border: Border.all(color: Colors.green),
          //     ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(picture.link))),
                  //child:
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // picture.cadastro == 'Morador'
                    //     ? Text(
                    //         picture.cadastro,
                    //         //picture.cadastro == 'morador'?
                    //         style: const TextStyle(
                    //           decoration: TextDecoration.none,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 15,
                    //           color: Colors.green,
                    //         ),
                    //       )
                    //     : Text(
                    //         picture.cadastro,
                    //         style: const TextStyle(
                    //           decoration: TextDecoration.none,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 15,
                    //           color: Colors.red,
                    //         ),
                    //       ),
                    Text(
                      "Nome : " + picture.name,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),

                    // Text(
                    //   "Apartamento : " + picture.ap,
                    //   style: const TextStyle(
                    //     decoration: TextDecoration.none,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    Text(
                      "Data : " + picture.data,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 55, 100),
                      ),
                    ),

                    Text(
                      "Horário: " + picture.horario,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 55, 100),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
        desktop: Container(
          //width: 200,
          height: 150,
          decoration: BoxDecoration(
              //color: Colors.green,
              //border: Border.all(),
              ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(picture.link))),
              //child:
            ),
            Text(
              "Nome : " + picture.name,
              style: const TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ]),
        ));
  }
}
