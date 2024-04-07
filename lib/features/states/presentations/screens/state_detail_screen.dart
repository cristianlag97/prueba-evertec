part of features.states.presentation.screens;

class StateDetailScreen extends ConsumerWidget {
  const StateDetailScreen({
    super.key,
    required this.state,
    required this.name,
  });

  final String state;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final stateDetailAsync = ref.watch(stateDetailinfo(state));
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'title-state-${name}',
          child: Text(
            name,
            style: textStyle.bodyLarge!.copyWith(fontSize: 22),
          ),
        ),
        centerTitle: false,
        forceMaterialTransparency: true,
        titleSpacing: 0,
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
        child: stateDetailAsync.when(
          data: (detail) => SingleChildScrollView(
            child: Padding(
              padding: padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInLeft(
                    child: FilledButton(
                      onPressed: () => _launchUrl(detail.covid19Site),
                      child: Text('Ir al sitio web'),
                    ),
                  ),
                  FadeInUp(child: Text(detail.notes)),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error al obtener el detalle: $error'),
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
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
