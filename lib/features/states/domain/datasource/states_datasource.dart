import '../entities/states_current_entity.dart';
import '../entities/states_info_entity.dart';

abstract class StatesDatasource {
  Future<List<StatesInfoEntity>> getStateInfo();
  Future<List<StatesCurrentEntity>> getStateCurrent();
  Future<StatesInfoEntity> getDEtailOfstate(String state);
}
