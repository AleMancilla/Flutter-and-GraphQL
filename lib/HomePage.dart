import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class HomePage extends StatelessWidget {

  final String setMetacion = """
  mutation insertUser(\$country : String, \$email: String, \$name: name, \$pass:String, \$phone:String) {
  insert_users_one(object:{
    country : \$country
    email: \$email
    name : \$name
    password : \$pass
    phone : \$phone
  }){
    id
    email
    name
  }
}
  """;

    final String setMet = """
  mutation insertUser {
  insert_users_one(object:{
    country : "XXXdfg"
    email: "XXXXdfdssdf"
    name : "XXXXsdfsdfsdf"
    password : "XXXsdfsdfsd"
    phone : "XXXsdfsdfsdf"
  }){
    id
    email
    name
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
        return FloatingActionButton(
          onPressed: () => runMutation(
            {
              "country": "PRUEBA",
              "email": "PRUEBA",
              "name": "PRUEBA",
              "pass": "PRUEBA",
              "phone": "PRUEBA"
            }
          ),
          tooltip: 'Star',
          child: Icon(Icons.star),
        );
      },
    );
  }
}