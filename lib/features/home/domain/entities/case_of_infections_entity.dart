part of feature.home.domain;

class CaseOfInfectionsEntity {
  final int positive;
  final int negative;
  final int pending;
  final int death;
  final int totalTestResults;
  final dynamic recovered;
  final int total;
  final int negativeIncrease;
  final int positiveIncrease;
  final int totalTestResultsIncrease;

  CaseOfInfectionsEntity({
    required this.positive,
    required this.negative,
    required this.pending,
    required this.recovered,
    required this.death,
    required this.total,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResults,
    required this.totalTestResultsIncrease,
  });

  CaseOfInfectionsEntity copyWith({
    int? positive,
    int? negative,
    int? pending,
    int? death,
    int? totalTestResults,
    dynamic recovered,
    int? total,
    int? negativeIncrease,
    int? positiveIncrease,
    int? totalTestResultsIncrease,
  }) =>
      CaseOfInfectionsEntity(
        positive: positive ?? this.positive,
        negative: negative ?? this.negative,
        pending: pending ?? this.pending,
        recovered: recovered ?? this.recovered,
        death: death ?? this.death,
        total: total ?? this.total,
        negativeIncrease: negativeIncrease ?? this.negativeIncrease,
        positiveIncrease: positiveIncrease ?? this.positiveIncrease,
        totalTestResults: totalTestResults ?? this.totalTestResults,
        totalTestResultsIncrease:
            totalTestResultsIncrease ?? this.totalTestResultsIncrease,
      );
}
