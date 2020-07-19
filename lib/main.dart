import 'package:flutter/material.dart';
import 'package:flutter_and_graphql/HomePage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httplink = HttpLink(uri: "https://guimy-data.herokuapp.com/v1/graphql",
  headers: {
    "content-type"          : "application/json",
    "x-hasura-admin-secret" : "NNO PUEDES VER ESTO"
  }
); 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ValueNotifier<GraphQLClient> client = new ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httplink, 
      )
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Material App',
        home: HomePage()
      ),
    );
  }
}