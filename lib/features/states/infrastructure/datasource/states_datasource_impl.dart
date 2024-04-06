import 'dart:convert';

import 'package:prueba_evertec/features/states/domain/datasource/states_datasource.dart';
import 'package:prueba_evertec/features/states/domain/entities/states_current_entity.dart';
import 'package:prueba_evertec/features/states/domain/entities/states_info_entity.dart';
import 'package:prueba_evertec/features/states/infrastructure/mappers/state_current_mapper.dart';
import 'package:prueba_evertec/features/states/infrastructure/models/states_current_model.dart';

import '../../../../core/config/config.dart';
import '../../../../core/plugins/dio_plugin.dart';
import '../mappers/state_info_mapper.dart';
import '../models/states_info_model.dart';

class StatesDatasourceImpl extends StatesDatasource {
  @override
  Future<List<StatesCurrentEntity>> getStateCurrent() async {
    try {
      final resp = await dio.get(statesCurrent);
      final current = statesCurrentModelFromJson(jsonEncode(resp.data));
      final currentMapper = StatesCurrentMapper.jsonToEntity(current);
      return currentMapper;
    } catch (e) {
      print('Error al obtener state current: $e');
      rethrow;
    }
  }

  @override
  Future<List<StatesInfoEntity>> getStateInfo() async {
    try {
      final resp = await dio.get(statesInfo);
      final info = statesInfoModelFromJson(jsonEncode(resp.data));
      final infoMapper = StatesInfoMapper.jsonToEntity(info);
      return infoMapper;
    } catch (e) {
      print('Error al obtener state info: $e');
      rethrow;
    }
  }
}
