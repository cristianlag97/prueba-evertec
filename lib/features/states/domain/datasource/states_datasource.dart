part of features.states.domain;

abstract class StatesDatasource {
  Future<List<StatesInfoEntity>> getStateInfo();
  Future<List<StatesCurrentEntity>> getStateCurrent();
  Future<StatesInfoEntity> getDEtailOfstate(String state);
}
