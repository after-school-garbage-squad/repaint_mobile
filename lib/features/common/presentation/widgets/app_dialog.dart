import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.children,
    this.onDismissed,
    this.automaticallyImplyLeading = true,
    this.leading,
  });

  final List<Widget> children;
  final VoidCallback? onDismissed;
  final bool automaticallyImplyLeading;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      elevation: 0.0,
      child: Container(
        width: 388,
        height: 388,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                if (automaticallyImplyLeading)
                  FlatIconButton(
                    onPressed: () {
                      if (onDismissed != null) {
                        onDismissed!();
                      } else {
                        context.popRoute();
                      }
                    },
                    icon: Icons.chevron_left,
                  ),
                if (leading != null) leading!,
                const Spacer(),
              ],
            ),
            const SizedBox(height: 24.0),
            ...children,
          ],
        ),
      ),
    );
  }
}
