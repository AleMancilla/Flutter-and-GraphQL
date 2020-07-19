import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class HomePage extends StatelessWidget {

  final String setMetacion = """
  mutation  NewUser {
  insert_users_one(object:{
    name : "FLUTTER"
    country : "Peru"
    email : "email@jo.com"
  }) {
    id
    name
    country
    email
  }
}
  """;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: Center(
        child: _prueba(),
      ),
    );
  }

  Widget _prueba(){
    return Mutation(
      options: MutationOptions(
        documentNode: gql(setMetacion), // this is the mutation string you just created
        // you can update the cache based on results
        // update: (Cache cache, QueryResult result) {
        //   return cache;
        // },
        // or do something with the result.data on completion
        onCompleted: (dynamic resultData) {
          print(resultData);
        },
      ),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) {
        // return FloatingActionButton(
        //   onPressed: () => runMutation({
        //     // 'starrableId': <A_STARTABLE_REPOSITORY_ID>,
        //   }),
        //   tooltip: 'Star',
        //   child: Icon(Icons.star),
        // );

    //runMutation({});
    print("###################### object");
    print(result.data); 
    print("###################### object");
    return Text("EXITO");
    // return Text(result.data.insert_users_one["name"]);
  },
);
    // Query(
    //   options: QueryOptions(
    //     documentNode: gql(getQuery)
    //   ), 
    //   builder: (QueryResult result, {fetchMore , refetch}){
    //     if (result.hasException) {
    //         return Text(result.exception.toString());
    //     }
 
    //     if (result.loading) {
    //       return Text('Loading');
    //     }

    //     final usuario = result.data["users"];
    //     print(" - ######## ${usuario.toString()}");
    //     return Text(usuario[0]["name"].toString());
    //   },
    // );
  }
}