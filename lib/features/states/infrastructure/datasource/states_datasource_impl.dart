part of features.states.infrastructure;

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
      final infoMapper = StatesInfoMapper.jsonToListEntity(info);
      return infoMapper;
    } catch (e) {
      print('Error al obtener state info: $e');
      rethrow;
    }
  }

  @override
  Future<StatesInfoEntity> getDEtailOfstate(String state) async {
    // final String url = statusDetails.replaceAll(':state', state.toLowerCase());
    try {
      final resp = await dio.get(statusDetails(state: state.toLowerCase()));
      final detail = StatesInfoModel.fromJson(resp.data);
      final mapper = StatesInfoMapper.jsonToEntity(detail);

      return mapper;
    } catch (e) {
      print('Error al obtener detail state info: $e');
      rethrow;
    }
  }
}
