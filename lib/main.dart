import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:sel0373/webpage.dart';
import 'package:sel0373/webteste.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/fundo.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center),
      //Positioned.fill(
      //child: BackdropFilter(
      //filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      //child: const SizedBox(),
      //)
      //),
      //Responsive(mobile: MobilePage(), desktop: WebPage()),
      const WebTeste(),
      //const WebPage(),
    ]);
  }
}
