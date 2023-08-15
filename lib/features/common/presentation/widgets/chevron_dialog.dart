import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class ChevronDialog extends StatelessWidget {
  const ChevronDialog({
    super.key,
    required this.children,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final List<Widget> children;
  final ScrollPhysics physics;

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
        width: 359,
        height: 359,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: physics,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
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
      ),
    );
  }
}
