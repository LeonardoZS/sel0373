import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sel0373/show_img.dart';

class GerenciarCadastros extends StatelessWidget {
  const GerenciarCadastros({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/fundo_certo.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center),
          Center(
              child: Column(children: [
            // ignore: prefer_const_constructors
            Text(
              'Ultimas fotos adicionadas no banco de dados',
              style: const TextStyle(
                decoration: TextDecoration.none,
                height: 2,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: UserInformation()),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 20,
                        shadowColor: Colors.green,
                      ),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Adicionar cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: null,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 20,
                        shadowColor: Colors.red,
                      ),
                      // ignore: sort_child_properrties_last
                      child: const Text(
                        'Remover cadastro',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: null,
                    )
                  ],
                )
              ],
            )
          ])),
        ],
      ),
    ));
  }
}