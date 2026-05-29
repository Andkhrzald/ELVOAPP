import 'package:flutter/material.dart';
import 'inti/tema.dart';
import 'layar/layar_login.dart';

class AplikasiElvo extends StatelessWidget {
  const AplikasiElvo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TemaElvo.tema,
      home: const LayarLogin(),
    );
  }
}
