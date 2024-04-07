part of features.states.infrastructure;

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
