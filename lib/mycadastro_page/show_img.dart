//import 'dart:ui';
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('cadastros').snapshots();

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

  List<Widget> getListWeb() {
    List<Widget> widgets = [];

    list.forEach((element) {
      widgets.add(ShowImage(picture: element));
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
            picture.cadastro = map['cadastro'];
            picture.ap = map['ap'];
            picture.rg = map['rg'];
            list.add(picture);
          });
        }

        return Responsive(
            mobile: ListView(children: getList()),
            desktop: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                children: getListWeb()));

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
          decoration: BoxDecoration(
              //color: Colors.green,
              //border: Border.all(color: Colors.green),
              ),
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
                    picture.cadastro == 'Morador'
                        ? Text(
                            picture.cadastro,
                            //picture.cadastro == 'morador'?
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          )
                        : Text(
                            picture.cadastro,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                    Text(
                      "Nome : " + picture.name,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Apartamento : " + picture.ap,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "RG : " + picture.rg,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ]),
        ),

        //------------------------------------------------------------------------

        desktop: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 200,
            // decoration: BoxDecoration(
            //   color: Colors.green,
            //   border: Border.all(),
            // ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(picture.link))),
                    //child:
                  ),
                  Container(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        picture.cadastro == 'Morador'
                            ? Text(
                                picture.cadastro,
                                //picture.cadastro == 'morador'?
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                picture.cadastro,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.red,
                                ),
                              ),
                        Text(
                          "Nome : " + picture.name,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Apartamento : " + picture.ap,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "RG : " + picture.rg,
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
                ]),
          ),
        ));
  }
}

// class MobileList extends StatelessWidget {
//   const MobileList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  ListView( children: getList());
//   }
// }

// class Webgrid extends StatelessWidget {
//   const Webgrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//         GridView.count(
//             //primary: false,
//             padding: const EdgeInsets.all(20),
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             crossAxisCount: 4,
//             children: getList());
//   }
// }
