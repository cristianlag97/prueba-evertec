part of feature.home.domain;

abstract class HomeDatasource {
  Future<CaseOfInfectionsEntity> getCasesOfInfect();
}
