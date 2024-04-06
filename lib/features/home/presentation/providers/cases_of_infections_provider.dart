import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/features/home/infrastructure/datasource/home_datasource_impl.dart';
import 'package:prueba_evertec/features/home/infrastructure/repositories/home_repository_impl.dart';

final homeRepositoryProvider =
    Provider((ref) => HomeRepositoryImpl(HomeDatasourceImpl()));

final homeProvider = FutureProvider((ref) async {
  final casesInfoCallback = ref.watch(homeRepositoryProvider);
  return await casesInfoCallback.getCasesOfInfect();
});
