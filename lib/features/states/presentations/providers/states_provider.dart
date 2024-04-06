import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/features/states/infrastructure/datasource/states_datasource_impl.dart';
import 'package:prueba_evertec/features/states/infrastructure/repositories/states_repository_impl.dart';

final statesCurrentRepositoryProvider =
    Provider((ref) => StatesRepositoryImpl(StatesDatasourceImpl()));

final stateCurrentsProvider = FutureProvider((ref) async {
  final currentCallBack = ref.watch(statesCurrentRepositoryProvider);
  return await currentCallBack.getStateCurrent();
});

final stateInfoProvider = FutureProvider((ref) async {
  final currentCallBack = ref.watch(statesCurrentRepositoryProvider);
  return await currentCallBack.getStateInfo();
});
