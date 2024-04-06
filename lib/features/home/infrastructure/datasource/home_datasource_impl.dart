import 'dart:convert';

import 'package:prueba_evertec/core/config/config.dart';
import 'package:prueba_evertec/core/plugins/dio_plugin.dart';
import 'package:prueba_evertec/features/home/domain/domain.dart';

import '../mappers/case_of_infections_mapper.dart';
import '../models/case_of_infections_model.dart';

class HomeDatasourceImpl extends HomeDatasource {
  @override
  Future<CaseOfInfectionsEntity> getCasesOfInfect() async {
    try {
      final resp = await dio.get(usCurrent);
      final cases = currentCaseOfInfectionsFromJson(jsonEncode(resp.data));
      final mapper = CaseOfInfectionsMapper.jsonToEntity(cases.first);
      return mapper;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
