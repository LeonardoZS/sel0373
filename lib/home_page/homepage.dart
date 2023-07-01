// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/services.dart';
import 'package:sel0373/login_page/authentication.dart';
import 'package:sel0373/mycadastro_page/gerenciar_cadastros.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/mycadastro_page/show_img.dart';
import 'package:sel0373/utilitys/show_img_2.dart';
import 'package:flutter/material.dart';
import '../Appbar/drawer.dart';
import '../responsive.dart';
import 'home_mobile_page.dart';
import 'home_web_page.dart';
import 'homepage2.dart';
import 'last_picture.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Future<bool> getCampoDoDocumento() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   final Stream<QuerySnapshot> _usersStream =
  //       FirebaseFirestore.instance.collection('testevideo').snapshots();

  //   // DocumentSnapshot snapshot =
  //   //     await firestore.collection('testevideo').doc('testedoleo').get();

  //   // Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;

  //   // Stream<QuerySnapshot<Map<String, dynamic>>> _usersFuture =
  //   // FirebaseFirestore.instance.collection('testedoleo').snapshots();

  //   // Verifica se o documento existe
  //   if (snapshot.exists) {
  //     String foto = map['foto'];
  //     return true;
  //   } else {}

  //   return false;
  // }

  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  //     .collection('testevideo')
  //     .where('analizado', isEqualTo: true)
  //     .snapshots();

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('request')
      .where('view', isEqualTo: 'false')
      .snapshots();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('token_abertura');

  CollectionReference collectionHistory =
      FirebaseFirestore.instance.collection('video');

  CollectionReference collectionRequest =
      FirebaseFirestore.instance.collection('request');

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
            'Home',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        child: DrawerTemplate(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (snapshot.data!.docs.isEmpty) {
                return Container();
              } else {
                //SystemSound.play(SystemSoundType.alert);
                // Map<String, dynamic> map =
                //     snapshot.data?.docs.last.data() as Map<String, dynamic>;

                int? i = snapshot.data?.docs.length;

                Map<String, dynamic> map = snapshot.data?.docs[(i! - 1)].data()
                    as Map<String, dynamic>;

                //    Map<String, dynamic> map =
                // snapshot.data?.docs.single.data() as Map<String, dynamic>;

                //snapshot.data?.docs[snapshot.data?.docs.length];
                String uid = snapshot.data?.docs.last.id as String;

                // CollectionReference collectionRequest =
                //     FirebaseFirestore.instance.collection('request');

                collectionRequest.doc(uid).update({
                  'view': 'true',
                });

                print(uid);

                Future(() => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Requisição de entrada',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //content: Text('HAAAAAAAAAAAAAAAAAAAA.'),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(120), // Image radius
                                    child: Image.network(map['foto'],
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        'Aceitar',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        elevation: 5,
                                        shadowColor:
                                            Color.fromARGB(255, 214, 223, 203),
                                      ),
                                      onPressed: () {
                                        collectionReference
                                            .doc('token_abertura')
                                            .update({
                                          'token': '1',
                                        });

                                        final data = <String, String>{
                                          "nome": map['nome'],
                                          "foto": map['foto'],
                                          "time": map['time'],
                                          "date": map['date'],
                                        };

                                        collectionHistory
                                            .doc()
                                            .set(data, SetOptions(merge: true));

                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        'Negar',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        elevation: 5,
                                        shadowColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();

                                        // collectionReference.doc(uid).update({
                                        //   'open': 'false',
                                        // });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ));

                return Container();
              }
            },
          ),
          HomePageTeste(),
        ],
      ),
    ));
  }
}

class HomePageTeste extends StatefulWidget {
  const HomePageTeste({super.key});

  @override
  State<HomePageTeste> createState() => _HomePageTesteState();
}

class _HomePageTesteState extends State<HomePageTeste> {
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Responsive(mobile: HomePage2(), desktop: HomeWebPage()))
        //])
        ;
  }
}

// _dialogBuilder(
//   BuildContext context,
// ) {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         //title: const Text('Basic dialog title'),
//         content: const Text('Insira abaixo os dados para um novo cadastro',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: <Widget>[],
//       );
//     },
//   );
// }

//     MaterialApp(
//         home: Scaffold(
//             //extendBodyBehindAppBar: true,
//             appBar: AppBar(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(30),
//                   ),
//                 ),
//                 title: Text(
//                   'Home',
//                   style: TextStyle(
//                     decoration: TextDecoration.none,
//                     color: Colors.black,
//                   ),
//                 ),
//                 centerTitle: true,
//                 //backgroundColor: Colors.transparent,
//                 backgroundColor: Colors.green,
//                 elevation: 0.0,
//                 iconTheme: const IconThemeData(color: Colors.black)),
//             drawer: Drawer(
//               // Add a ListView to the drawer. This ensures the user can scroll
//               // through the options in the drawer if there isn't enough vertical
//               // space to fit everything.
//               child: DrawerTemplate(),
//             ),
//             backgroundColor: Colors.white,
//             // body: Stack(children: [
//             //   Image.asset("assets/images/blur.jpg",
//             //       width: double.infinity,
//             //       height: double.infinity,
//             //       fit: BoxFit.cover,
//             //       alignment: Alignment.center),
//             body: Center(
//                 child: Responsive(mobile: HomePage2(), desktop: HomeWebPage()))
//             //])
//             ));
//   }
// }
