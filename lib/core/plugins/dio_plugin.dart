import 'package:dio/dio.dart';

Dio get dio => Dio(
      BaseOptions(baseUrl: 'https://api.covidtracking.com/v1'),
    );
