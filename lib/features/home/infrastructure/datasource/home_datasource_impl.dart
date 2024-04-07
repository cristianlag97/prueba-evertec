part of feature.home.infrastructure;

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
