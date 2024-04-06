import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/config/config.dart';
import 'package:prueba_evertec/shared/shared.dart';
import '../providers/states_provider.dart';
import '../widgets/build_item.dart';

class StatesScreen extends ConsumerWidget {
  const StatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final statesInfoAsync = ref.watch(stateInfoProvider);
    final statesCurrentsAsync = ref.watch(stateCurrentsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles por región',
          style: textStyle.bodyLarge!.copyWith(fontSize: 22),
        ),
        centerTitle: false,
      ),
      body: ContainerBackground(
        color: colorWhite,
        child: statesInfoAsync.when(
          data: (data) {
            return statesCurrentsAsync.when(
              data: (currentStateData) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final infoData = data[index];
                    final currentData = currentStateData[index];

                    return BuildItem(
                      info: infoData,
                      current: currentData,
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
