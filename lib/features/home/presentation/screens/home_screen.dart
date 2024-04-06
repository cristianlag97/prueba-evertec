import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/config/config.dart';
import 'package:prueba_evertec/features/home/presentation/widgets/device_information_container_widget.dart';
import 'package:prueba_evertec/features/home/presentation/widgets/information_container_widget.dart';
import 'package:prueba_evertec/features/home/presentation/widgets/switch_theme.dart';
import 'package:prueba_evertec/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ContainerBackground(
        isRequired: true,
        color: colorWhite,
        child: _HomeView(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: colorOrange,
        onPressed: () {},
        child: const Icon(Icons.add, color: colorWhite),
      ),
    );
  }
}

class _HomeView extends ConsumerWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final containerWidth = size.width * 0.9;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Stack(
      children: <Widget>[
        Positioned(
          left: size.width * 0.1,
          top: -40,
          child: Image.asset('assets/images/istockphoto.jpg'),
        ),
        Positioned(
          top: size.height * 0.06,
          left: -(size.width * 0.02),
          child: Image.asset(
            'assets/images/coronavirus.png',
            width: size.width * 0.4,
          ),
        ),
        Positioned(
          right: size.width * 0.05,
          top: size.height * 0.07,
          child: IconButton(
            onPressed: () => router.pushReplacement(PAGES.login.screenPath),
            icon: Icon(
              Icons.logout_rounded,
              size: size.height * 0.04,
              color: colorBlack,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: ContainerInformation(
            isDarkMode: isDarkMode,
          ),
        ),
        Positioned(
          top: size.height * 0.33,
          left: (size.width - containerWidth) / 2,
          child: DeviceIformationContainer(
            isDarkMode: isDarkMode,
          ),
        ),
        Positioned(
          top: size.height * 0.48,
          right: size.width * 0.05,
          child: const SwitchThemeApp(),
        ),
      ],
    );
  }
}
