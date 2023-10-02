import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension TextWithCopyableExtension on Text {
  Widget copiableTextWidget(BuildContext context) {
    return InkWell(
      onLongPress: () {
        final textToCopy = data;
        Clipboard.setData(ClipboardData(text: textToCopy ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to Clipboard'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: this,
    );
  }
}

// class CopyTextExtensionPage extends StatelessWidget {
//   const CopyTextExtensionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: const Text(
//           'Make a long press on this text to copy it',
//           textAlign: TextAlign.center,
//         ).copiableTextWidget(context),
//       ),
//     );
//   }
// }
