import 'package:prueba_evertec/features/states/domain/datasource/states_datasource.dart';
import 'package:prueba_evertec/features/states/domain/entities/states_current_entity.dart';
import 'package:prueba_evertec/features/states/domain/entities/states_info_entity.dart';
import 'package:prueba_evertec/features/states/domain/repositories/states_repository.dart';

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
}
