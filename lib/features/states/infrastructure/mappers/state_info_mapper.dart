import '../../domain/entities/states_info_entity.dart';
import '../models/states_info_model.dart';

class StatesInfoMapper {
  static List<StatesInfoEntity> jsonToListEntity(
      List<StatesInfoModel> infoList) {
    return infoList
        .map((info) => StatesInfoEntity(
              state: info.state,
              name: info.name,
              notes: info.notes,
              covid19Site: info.covid19Site,
            ))
        .toList();
  }

  static jsonToEntity(StatesInfoModel info) => StatesInfoEntity(
        state: info.state,
        name: info.name,
        notes: info.notes,
        covid19Site: info.covid19Site,
      );
}
