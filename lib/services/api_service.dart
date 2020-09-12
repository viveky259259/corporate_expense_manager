import 'dart:async';
import 'dart:io';

import 'package:hasura_connect/hasura_connect.dart';
import 'package:http/http.dart' as http;

class ApiService {
  HasuraConnect hasuraConnect = HasuraConnect(
      'https://more-cub-12.hasura.app/v1/graphql',
      headers: {'x-hasura-admin-secret': 'vivek@rirev.com'});

  Future<dynamic> query(query, {variables, Map<String, dynamic> headers}) async {
    if (headers != null) {
      hasuraConnect.headers.addAll(headers);
    }
    variables = variables != null ? variables : <String, dynamic>{};
    var result = {};
    try {
      result = await hasuraConnect.query(query, variables: variables);
    } on HasuraError catch (_) {
      print("Hasura query error: ${_.toString()}");
    }
    return result['data'];
  }

  Future<dynamic> mutation(query, variables, {Map<String, dynamic> headers}) async {
    variables = variables != null ? variables : <String, dynamic>{};
    var result = {};
    try {
      result = await hasuraConnect.mutation(query, variables: variables);
    } on HasuraError catch (_) {
      print("Hasura mutation error: ${_.toString()}");
    }
    return result['data'];
  }

  Stream<dynamic> subscribe(query, variables, key, {Map<String, dynamic> headers}) {
    variables = variables != null ? variables : <String, dynamic>{};

    try {
      Snapshot snapshot =
          hasuraConnect.subscription(query, variables: variables, key: key);
      return snapshot.map((result) {
        return result['data'];
      });
    } catch (_) {
      print("Hasura subscription error: ${_.toString()}");
      return null;
    }
  }
}
