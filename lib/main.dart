import 'package:flutter/material.dart';
import 'package:rendu_tp/pages/login.page.dart'; // Assurez-vous que le chemin d'importation est correct

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Définissez LoginPage comme page d'accueil
    );
  }
}
