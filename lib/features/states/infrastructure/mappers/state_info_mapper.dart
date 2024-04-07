part of features.states.infrastructure;

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
