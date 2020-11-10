import 'package:coronavirus_rest_api/service/endpoint_data.dart';
import 'package:flutter/foundation.dart';
import 'package:coronavirus_rest_api/service/api.dart';

class EndpointsData {
  EndpointsData({@required this.values});

  final Map<Endpoint, EndpointData> values;

  EndpointData get cases => values[Endpoint.cases];

  EndpointData get casesSuspected => values[Endpoint.casesSuspected];

  EndpointData get casesConfirmed => values[Endpoint.casesConfirmed];

  EndpointData get deaths => values[Endpoint.deaths];

  EndpointData get recovered => values[Endpoint.recovered];

  @override
  String toString() =>
      'cases: $cases, suspected: $casesSuspected, confirmed: $casesConfirmed, deaths: $deaths, recovered: $recovered ';
}