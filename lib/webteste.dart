import 'package:sel0373/gerenciar_cadastros.dart';
import 'package:sel0373/show_img.dart';
import 'package:sel0373/show_img_2.dart';
import 'package:flutter/material.dart';

import 'last_picture.dart';

class WebTeste extends StatelessWidget {
  const WebTeste({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            //width: MediaQuery.of(context).size.width * 0.9,
            //height: MediaQuery.of(contextr).size.height * 0.9,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Column(children: <Widget>[
              // ignore: prefer_const_constructors
              Text(
                'Foto da portaria',
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  height: 2,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        //elevation: 10,
                        child: Container(width: 140, height: 120)),
                    Card(
                      elevation: 10,
                      child: Container(
                        width: 500,
                        height: 500,
                        child: LastPicture(),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            elevation: 20,
                            shadowColor: Colors.lightBlueAccent,
                          ),
                          // ignore: sort_child_properties_last
                          child: const Text(
                            'Gerenciar cadastros',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GerenciarCadastros()),
                            );
                          },
                        )),
                  ]),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 20,
                          shadowColor: Colors.green,
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
            ])));
  }
}
