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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Authentication());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(child: DrawerTemplate()),
      body: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return
        //Positioned.fill(
        //child: BackdropFilter(
        //filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        //child: const SizedBox(),
        //)
        //),
        //Responsive(mobile: MobilePage(), desktop: WebPage()),
        HomePage();
    //const WebPage(),
  }
}
