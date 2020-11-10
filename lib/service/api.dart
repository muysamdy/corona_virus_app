import 'package:coronavirus_rest_api/service/api_key.dart';
import 'package:flutter/cupertino.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({@required this.apiKey});

  final String apiKey;

  factory API.sandbox() => API(apiKey: APIkeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';
  static final int port = 443;
  static final String basePath = 't/nubentos.com/ncovapi/1.0.0';

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'cases/suspected',
    Endpoint.casesConfirmed: 'cases/confirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host, 
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );
}
