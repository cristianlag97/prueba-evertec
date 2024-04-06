import '../../domain/entities/states_info_entity.dart';
import '../models/states_info_model.dart';

class StatesInfoMapper {
  static List<StatesInfoEntity> jsonToEntity(List<StatesInfoModel> infoList) {
    return infoList
        .map((info) => StatesInfoEntity(
              state: info.state,
              name: info.name,
            ))
        .toList();
  }
  // static jsonToEntity(StatesInfoModel info) => StatesInfoEntity(
  //       state: info.state,
  //       name: info.name,
  //     );
}
