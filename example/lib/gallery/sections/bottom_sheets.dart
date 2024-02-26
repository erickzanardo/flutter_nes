import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class BottomSheetsSection extends StatelessWidget {
  const BottomSheetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bottom Sheets',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Show Bottom Sheet'),
              onPressed: () {
                NesBottomSheet.show<void>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
