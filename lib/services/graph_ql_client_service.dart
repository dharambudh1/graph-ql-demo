import "dart:developer";

import "package:gql/ast.dart";
import "package:graph_ql_demo/models/get_a_char.dart";
import "package:graph_ql_demo/models/get_all_char.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLClientService {
  GraphQLClientService._();
  static final GraphQLClientService instance = GraphQLClientService._();

  final HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
  final GraphQLCache cache = GraphQLCache();

  Future<GetAllChar> getAllCharAPI({required int page}) async {
    GetAllChar getAllChar = GetAllChar();

    try {
      final GraphQLClient qlClient = GraphQLClient(link: link, cache: cache);
      final String query = getAllCharQuery(page: page);
      final DocumentNode node = gql(query);
      final QueryOptions<DocumentNode> options = QueryOptions<DocumentNode>(
        document: node,
      );
      final QueryResult<DocumentNode> result = await qlClient.query(options);
      getAllChar = GetAllChar.fromJson(result.data ?? <String, dynamic>{});
    } on Exception catch (error) {
      log("getAllCharAPI(): Exception: $error");
    } finally {}
    return Future<GetAllChar>.value(getAllChar);
  }

  Future<GetAChar> getACharAPI({required String id}) async {
    GetAChar getAChar = GetAChar();

    try {
      final GraphQLClient qlClient = GraphQLClient(link: link, cache: cache);
      final String query = getACharQuert(id: id);
      final DocumentNode node = gql(query);
      final QueryOptions<DocumentNode> options = QueryOptions<DocumentNode>(
        document: node,
      );
      final QueryResult<DocumentNode> result = await qlClient.query(options);
      getAChar = GetAChar.fromJson(result.data ?? <String, dynamic>{});
    } on Exception catch (error) {
      log("getACharAPI(): Exception: $error");
    } finally {}
    return Future<GetAChar>.value(getAChar);
  }

  String getAllCharQuery({required int page}) {
    final String query = """
{
  characters(page: $page) {
    info {
      count
      pages
      next
      prev
    }
    results {
      id
      name
      image
    }
  }
}
""";
    return query;
  }

  String getACharQuert({required String id}) {
    final String query = """
{
  character(id: $id) {
    id
    name
    status
    species
    type
    gender
    image
    created
  }
}
""";
    return query;
  }
}
