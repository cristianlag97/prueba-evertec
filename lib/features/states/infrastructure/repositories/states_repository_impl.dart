part of features.states.infrastructure;

class StatesRepositoryImpl extends StatesRepository {
  final StatesDatasource statesDatasource;

  StatesRepositoryImpl(this.statesDatasource);

  @override
  Future<List<StatesCurrentEntity>> getStateCurrent() {
    return statesDatasource.getStateCurrent();
  }

  @override
  Future<List<StatesInfoEntity>> getStateInfo() {
    return statesDatasource.getStateInfo();
  }

  @override
  Future<StatesInfoEntity> getDEtailOfstate(String state) {
    return statesDatasource.getDEtailOfstate(state);
  }
}
