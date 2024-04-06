import 'package:prueba_evertec/features/home/domain/domain.dart';
import 'package:prueba_evertec/features/home/infrastructure/models/case_of_infections_model.dart';

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
