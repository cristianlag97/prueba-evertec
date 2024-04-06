import 'package:prueba_evertec/features/states/domain/entities/states_current_entity.dart';
import 'package:prueba_evertec/features/states/infrastructure/models/states_current_model.dart';

class StatesCurrentMapper {
  static List<StatesCurrentEntity> jsonToEntity(
          List<StatesCurrentModel> currentList) =>
      currentList
          .map((current) => StatesCurrentEntity(
                totalTestResults: current.totalTestResults,
                positive: current.positive,
                lastUpdateEt: current.lastUpdateEt,
              ))
          .toList();
}
