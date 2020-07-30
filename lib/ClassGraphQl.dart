import 'package:graphql/client.dart';

final HttpLink _httpLink = HttpLink(
    uri: 'https://guimy-data.herokuapp.com/v1/graphql',
    headers: {
      "content-type":"application/json",
      "x-hasura-admin-secret":"1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik,9ol.0p"
    }
);
String token = "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik,9ol.0p";

final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
);

final Link _link = _authLink.concat(_httpLink);

final GraphQLClient _client = GraphQLClient(
        cache: InMemoryCache(),
        link: _link,
    );



const String readRepositories = r'''
  query MyQuery {
  users {
    id
    name
    password
    phone
  }
}
''';

final QueryOptions options = QueryOptions(
    documentNode: gql(readRepositories),
    // variables: <String, dynamic>{
      
    // },
);





class ClassGraphQl {

  ejecutar()async{
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
        print(result.exception.toString());
    }

    final repositories = result.data;
    print("### $repositories");
  }

}