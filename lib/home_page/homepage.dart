// ignore_for_file: prefer_const_constructors

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
                //backgroundColor: Colors.transparent,
                backgroundColor: Colors.green,
                elevation: 0.0,
                iconTheme: const IconThemeData(color: Colors.black)),
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: DrawerTemplate(),
            ),
            backgroundColor: Colors.white,
            // body: Stack(children: [
            //   Image.asset("assets/images/blur.jpg",
            //       width: double.infinity,
            //       height: double.infinity,
            //       fit: BoxFit.cover,
            //       alignment: Alignment.center),
            body: Center(
                child: Responsive(mobile: HomePage2(), desktop: HomeWebPage()))
            //])
            ));
  }
}
