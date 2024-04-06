import 'package:prueba_evertec/features/home/domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<CaseOfInfectionsEntity> getCasesOfInfect() {
    return homeDatasource.getCasesOfInfect();
  }
}
