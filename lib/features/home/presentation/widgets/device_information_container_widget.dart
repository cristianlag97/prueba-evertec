import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_evertec/core/config/config.dart';
import 'package:prueba_evertec/features/home/presentation/providers/device_information.provider.dart';

class DeviceIformationContainer extends ConsumerWidget {
  const DeviceIformationContainer({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(deviceInfoProvider(context));
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(left: 32),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: isDarkMode ? colorDarkMode : colorWhite,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: deviceInfoAsync.when(
        data: (data) {
          List<TableRow> rows = [];
          var entries = data.entries.toList();
          int totalEntries = entries.length;
          int numberOfRows = (totalEntries / 2).ceil();

          for (int i = 0; i < numberOfRows; i++) {
            var entry1 = entries[i * 2];
            var entry2 = (i * 2 + 1 < totalEntries) ? entries[i * 2 + 1] : null;

            rows.add(
              TableRow(
                children: [
                  TableCell(
                    child: SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: entry1.key == 'Fecha actual'
                            ? DeviceInfoItemDateTime(entry1: entry1)
                            : DeviceInfoItem(entry: entry1),
                      ),
                    ),
                  ),
                  if (entry2 != null)
                    TableCell(
                      child: SizedBox(
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: DeviceInfoItem(entry: entry2),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }

          return Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: rows,
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class DeviceInfoItemDateTime extends StatelessWidget {
  const DeviceInfoItemDateTime({
    super.key,
    required this.entry1,
  });

  final MapEntry<String, dynamic> entry1;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          entry1.value,
          style: entry1.key == 'Fecha actual'
              ? textStyle.bodyLarge!.copyWith(fontSize: 22)
              : textStyle.bodySmall,
        ),
        Text(
          entry1.key,
          style: textStyle.bodySmall!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

class DeviceInfoItem extends StatelessWidget {
  const DeviceInfoItem({
    super.key,
    required this.entry,
  });

  final MapEntry<String, dynamic> entry;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          entry.key,
          style: textStyle.bodySmall!.copyWith(fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          entry.value,
          style: textStyle.bodySmall,
        )
      ],
    );
  }
}
