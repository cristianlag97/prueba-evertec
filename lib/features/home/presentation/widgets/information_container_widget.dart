part of features.home.presentation.widgets;

class ContainerInformation extends StatelessWidget {
  const ContainerInformation({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: paddingHorizontal24,
      width: size.width,
      height: size.height * 0.55,
      decoration: BoxDecoration(
        color: isDarkMode ? colorDarkMode.withOpacity(0.8) : colorLightGrayBF,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.1),
          const Text('Fecha recolección datos: dd.mm.yyy'),
          sizedBox12,
          const _CasesOfInfectionsView(),
          sizedBox18,
          SizedBox(
            width: size.width * 0.9,
            child: Text(
              "El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021.",
              style: textStyle.bodySmall!.copyWith(
                  fontSize: 10, color: Color.fromARGB(255, 122, 123, 123)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CasesOfInfectionsView extends ConsumerWidget {
  const _CasesOfInfectionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProviderAsync = ref.watch(homeProvider);
    return homeProviderAsync.when(
      data: (data) => GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10),
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: size16,
        mainAxisSpacing: size8,
        children: <Widget>[
          BuildCard(
            title: "Casos totales",
            value: formatterNumber(data.totalTestResults),
          ),
          BuildCard(
            title: "Casos confirmados",
            value: formatterNumber(data.positive),
          ),
          BuildCard(
            title: "Pruebas negativas",
            value: formatterNumber(data.negative),
          ),
          BuildCard(
            title: "Pruebas positivas",
            value: formatterNumber(data.positive),
          ),
          BuildCard(
            title: "Fallecidos",
            value: formatterNumber(data.death),
          ),
          BuildCard(
            title: "Recuperados",
            value: formatterNumber(data.recovered ?? 0),
          ),
          BuildCard(
            title: "Pruebas pendientes",
            value: formatterNumber(data.pending),
          ),
        ],
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
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
    );
  }
}

class BuildCard extends ConsumerWidget {
  const BuildCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? colorDarkMode : colorWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: textStyle.bodyMedium,
          ),
          Text(
            title,
            style: textStyle.bodySmall!.copyWith(color: colorLightGrayBF),
          ),
        ],
      ),
    );
  }
}
