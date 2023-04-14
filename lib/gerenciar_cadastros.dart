import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sel0373/show_img.dart';

class GerenciarCadastros extends StatelessWidget {
  const GerenciarCadastros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: UserInformation(),
      ),
    );
  }
}
