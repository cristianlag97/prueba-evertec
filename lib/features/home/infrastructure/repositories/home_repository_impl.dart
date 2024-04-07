part of feature.home.infrastructure;

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<CaseOfInfectionsEntity> getCasesOfInfect() {
    return homeDatasource.getCasesOfInfect();
  }
}
