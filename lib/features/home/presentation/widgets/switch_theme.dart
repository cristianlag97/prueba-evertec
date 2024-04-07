part of features.home.presentation.widgets;

class SwitchThemeApp extends ConsumerWidget {
  const SwitchThemeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Container(
      width: size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0XFF676667), width: 2),
        color: colorLightGrayB0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => ref
                  .read(themeNotifierProvider.notifier)
                  .toggleDarkMode(false),
              child: Container(
                alignment: Alignment.center,
                padding: padding8,
                decoration: BoxDecoration(
                  color: !isDarkMode ? colorWhite : colorGraySwitch,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Container(
                  padding: padding8,
                  decoration: BoxDecoration(
                    color: !isDarkMode ? colorWhite : colorGraySwitch,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorBlack.withOpacity(0.2),
                        blurRadius: 9,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.light_mode_outlined,
                    color: colorLightGrayB0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () =>
                  ref.read(themeNotifierProvider.notifier).toggleDarkMode(true),
              child: Container(
                alignment: Alignment.center,
                padding: padding8,
                decoration: BoxDecoration(
                    color: isDarkMode ? colorWhite : colorGraySwitch,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Container(
                  padding: padding8,
                  decoration: BoxDecoration(
                    color: isDarkMode ? colorWhite : colorGraySwitch,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorBlack.withOpacity(0.2),
                        blurRadius: 9,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    color: colorLightGrayB0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
