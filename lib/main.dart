import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:sel0373/show_img.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
      //),
      //),
      //Responsive(mobile: MobilePage(), desktop: WebPage()),
      WebPage(),
    ]);
  }
}

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //heightFactor: 3,
      //widthFactor: 0.8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          //height: MediaQuery.of(context).size.height * 0.4,
          //color: Colors.white,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              )),
          child: Column(children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              'Ultimas fotos armazenadas no banco de dados',
              style: const TextStyle(
                decoration: TextDecoration.none,
                height: 2,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                    elevation: 10,
                    child: Container(
                        width: 500, height: 500, child: UserInformation()))),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        elevation: 20,
                        shadowColor: Colors.lightBlueAccent,
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Adicionar novo cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: null,
                    ))),
            const SizedBox(height: 30)
          ])),
    );
  }
}
