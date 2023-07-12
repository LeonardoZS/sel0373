// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:sel0373/login_page/authentication.dart';
import 'package:sel0373/mycadastro_page/gerenciar_cadastros.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/mycadastro_page/show_img.dart';
import 'package:sel0373/utilitys/show_img_2.dart';
import 'package:flutter/material.dart';
import '../Appbar/drawer.dart';
import '../responsive.dart';
import 'home_web_page.dart';
import 'homepage2.dart';
import 'last_picture.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('request')
      .where('view', isEqualTo: 'false')
      .limit(1)
      .snapshots();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('token_abertura');

  CollectionReference collectionHistory =
      FirebaseFirestore.instance.collection('video');

  CollectionReference collectionRequest =
      FirebaseFirestore.instance.collection('request');

  int flag = 1;

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
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 149, 228, 167),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        child: DrawerTemplate(),
      ),
      backgroundColor: Colors.white,
      body: Builder(
          usersStream: _usersStream,
          collectionRequest: collectionRequest,
          collectionReference: collectionReference,
          collectionHistory: collectionHistory,
          flag: flag),
    ));
  }
}

class Builder extends StatefulWidget {
  Builder({
    super.key,
    required this.usersStream,
    required this.collectionRequest,
    required this.collectionReference,
    required this.collectionHistory,
    required int flag,
  });

  final Stream<QuerySnapshot<Object?>> usersStream;
  final CollectionReference<Object?> collectionRequest;
  final CollectionReference<Object?> collectionReference;
  final CollectionReference<Object?> collectionHistory;
  int flag = 1;

  @override
  State<Builder> createState() => _BuilderState();
}

class _BuilderState extends State<Builder> {
  late int flag;

  @override
  void didChangeDependencies() {
    print("No did");
    flag = 1;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("No build");
    print(flag);
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: widget.usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print("Att snapshot");
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            if (snapshot.data!.docs.isEmpty) {
              return Container();
            } else {
              final player = AudioPlayer();
              player.play(UrlSource('assets/audio/SomCUT2.mp3'));
              int? i = snapshot.data?.docs.length;
              Map<String, dynamic> map =
                  snapshot.data?.docs[(i! - 1)].data() as Map<String, dynamic>;

              String uid = snapshot.data?.docs.last.id as String;

              print(uid);
              print(flag);
              print('-------');

              if (flag == 1) {
                flag = 0;

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
                                        flag = 1;
                                        widget.collectionRequest
                                            .doc(uid)
                                            .update({
                                          'view': 'true',
                                        });

                                        widget.collectionReference
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

                                        widget.collectionHistory
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
                                        flag = 1;
                                        widget.collectionRequest
                                            .doc(uid)
                                            .update({
                                          'view': 'true',
                                        });
                                        Navigator.of(context).pop();
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
              } else {}

              return Container();
            }
          },
        ),
        Expanded(
          child: HomePageReal(),
        )
      ],
    );
  }
}

/*

class Builder extends StatelessWidget {
  // var collectionToken;

  Builder({
    super.key,
    required Stream<QuerySnapshot<Object?>> usersStream,
    required this.collectionRequest,
    required this.collectionReference,
    required this.collectionHistory,
    required int flag,
  }) : _usersStream = usersStream;

  final Stream<QuerySnapshot<Object?>> _usersStream;
  final CollectionReference<Object?> collectionRequest;
  final CollectionReference<Object?> collectionReference;
  final CollectionReference<Object?> collectionHistory;
  int flag = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              int? i = snapshot.data?.docs.length;
              Map<String, dynamic> map =
                  snapshot.data?.docs[(i! - 1)].data() as Map<String, dynamic>;

              String uid = snapshot.data?.docs.last.id as String;

              print(uid);
              print(flag);
              print('-------');

              if (flag == 1) {
                flag = 0;

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
                                        flag = 1;
                                        collectionRequest.doc(uid).update({
                                          'view': 'true',
                                        });

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
                                        flag = 1;
                                        collectionRequest.doc(uid).update({
                                          'view': 'true',
                                        });
                                        Navigator.of(context).pop();
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
              } else {}

              return Container();
            }
          },
        ),
        Expanded(
          child: HomePageReal(),
        )
      ],
    );
  }
}
*/
class HomePageReal extends StatelessWidget {
  const HomePageReal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Responsive(mobile: HomeMobilePage(), desktop: HomeWebPage()))
        //])
        ;
  }
}
