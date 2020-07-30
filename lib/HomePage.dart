import 'package:flutter/material.dart';
import 'package:flutter_and_graphql/ClassGraphQl.dart';

ClassGraphQl grapql = new ClassGraphQl();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hola"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: grapql.ejecutar
      ),
    );
  }
}