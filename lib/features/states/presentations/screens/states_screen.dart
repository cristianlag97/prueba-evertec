part of features.states.presentation.screens;

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
        titleSpacing: 0,
        forceMaterialTransparency: true,
        shadowColor: Colors.grey,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      body: ContainerBackground(
        color: colorWhite,
        child: statesInfoAsync.when(
          data: (data) {
            return statesCurrentsAsync.when(
              data: (currentStateData) {
                return FadeInUp(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final infoData = data[index];
                      final currentData = currentStateData[index];

                      return BuildItem(
                        info: infoData,
                        current: currentData,
                      );
                    },
                  ),
                );
              },
              loading: () => Center(
                child: Spin(
                  infinite: true,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/loading.png',
                    width: 100,
                  ),
                ),
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            );
          },
          loading: () => Center(
            child: Spin(
              infinite: true,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/loading.png',
                width: 100,
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
