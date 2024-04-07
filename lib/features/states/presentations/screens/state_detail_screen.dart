import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/config/config.dart';
import 'package:prueba_evertec/features/states/presentations/providers/states_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../shared/shared.dart';

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
          loading: () => const Center(
            child: CircularProgressIndicator(),
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
