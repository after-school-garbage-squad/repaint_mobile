import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.children,
    this.leading,
  });

  final List<Widget> children;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      elevation: 0.0,
      child: Container(
        // TODO: デザイン通りになるように実装したが調整するべき
        width: 360,
        height: 360,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                leading ??
                    FlatIconButton(
                      onPressed: context.popRoute,
                      icon: Icons.chevron_left,
                      size: 24.0,
                    ),
                const Spacer()
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
