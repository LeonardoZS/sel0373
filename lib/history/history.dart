// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sel0373/main.dart';
import 'package:sel0373/mycadastro_page/show_img.dart';
import 'package:sel0373/responsive.dart';
import 'package:sel0373/utilitys/adicionar_cadastros.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Appbar/drawer.dart';
import 'history_information.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HistoryMobilePage(), desktop: HistoryWebPage());
  }
}

class HistoryMobilePage extends StatefulWidget {
  const HistoryMobilePage({super.key});

  @override
  State<HistoryMobilePage> createState() => _HistoryMobilePageState();
}

class _HistoryMobilePageState extends State<HistoryMobilePage> {
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
            'Historico',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          backgroundColor: Colors.green,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),

      drawer: Drawer(
        child: DrawerTemplate(),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height * 0.8,
                child: HistoryInformation()),
          )
          //SizedBox(height: 30),
        ],
      )),
    ));
  }
}

class HistoryWebPage extends StatefulWidget {
  const HistoryWebPage({super.key});

  @override
  State<HistoryWebPage> createState() => _HistoryWebPageState();
}

class _HistoryWebPageState extends State<HistoryWebPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
