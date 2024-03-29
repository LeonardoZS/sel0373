// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:sel0373/Appbar/drawer.dart';
import 'package:sel0373/home_page/homepage.dart';
import 'login_page/authentication.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:sel0373/mycadastro_page/gerenciar_cadastros.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Authentication());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
