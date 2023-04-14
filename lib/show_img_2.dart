//import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:flutter/material.dart';

class UserInformation2 extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation2> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('video').snapshots();

  List<Picture> list = [];

  List<Widget> getList() {
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
            list.add(picture);
          });
        }

        return ListView(
          children: getList(),
        );
      },
    );
  }
}

class Picture {
  late String name;
  late String link;
}

class ShowImage extends StatelessWidget {
  final Picture picture;

  ShowImage({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Image.network(picture.link),
    );
  }
}
