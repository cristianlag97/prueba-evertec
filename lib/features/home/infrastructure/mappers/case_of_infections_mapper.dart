part of feature.home.infrastructure;

class CaseOfInfectionsMapper {
  static jsonToEntity(CaseOfInfectionsModel cases) => CaseOfInfectionsEntity(
        positive: cases.positive,
        negative: cases.negative,
        pending: cases.pending,
        recovered: cases.recovered,
        death: cases.death,
        total: cases.total,
        negativeIncrease: cases.negativeIncrease,
        positiveIncrease: cases.positiveIncrease,
        totalTestResults: cases.totalTestResults,
        totalTestResultsIncrease: cases.totalTestResultsIncrease,
      );
}
