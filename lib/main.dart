import 'package:flutter/material.dart';
import 'package:flutter_and_graphql/HomePage.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Material App',
        home: HomePage()
      
    );
  }
}