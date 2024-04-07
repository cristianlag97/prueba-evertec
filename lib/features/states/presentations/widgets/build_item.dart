import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/config.dart';
import '../../../../core/core.dart';
import '../../domain/domain.dart';

class BuildItem extends ConsumerWidget {
  const BuildItem({
    super.key,
    required this.info,
    required this.current,
  });

  final StatesInfoEntity info;
  final StatesCurrentEntity current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return GestureDetector(
      onTap: () => router.push('/details/${info.state}/${info.name}'),
      child: Container(
        margin: padding16,
        padding: const EdgeInsets.symmetric(horizontal: size8, vertical: size4),
        decoration: BoxDecoration(
            color: isDarkMode ? Color(0XFF49494C) : colorLightGrayF2,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorLightGrayB0)),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/use_flag.png', width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Hero(
                    tag: 'title-state-${info.name}',
                    child: Text(
                      info.name,
                      style: textStyle.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Casos totales: ',
                    style: textStyle.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isDarkMode ? colorLightGrayF2 : colorsTextStates),
                    children: <InlineSpan>[
                      TextSpan(
                        text: formatterNumber(current.totalTestResults),
                        style: textStyle.bodySmall!.copyWith(
                            color: isDarkMode
                                ? colorLightGrayF2
                                : colorsTextStates),
                      )
                    ],
                  ),
                ),
                Text(
                  'Última modificación: ${formatterDateTime(current.lastUpdateEt)}',
                  style: textStyle.bodySmall!.copyWith(
                      color: isDarkMode ? colorLightGrayF2 : colorsTextStates),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
