import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:flutter/material.dart';

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
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      elevation: 10,
                      child: Container(
                          width: 500, height: 500, child: UserInformation())),
                  Card(
                      elevation: 10,
                      child: Container(
                          width: 500, height: 500, child: UserInformation2()))
                ]),
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
                        'Liberar acesso',
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
