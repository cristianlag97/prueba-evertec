import '../entities/states_current_entity.dart';
import '../entities/states_info_entity.dart';

abstract class StatesRepository {
  Future<List<StatesInfoEntity>> getStateInfo();
  Future<List<StatesCurrentEntity>> getStateCurrent();
}
