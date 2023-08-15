import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

@RoutePage()
class OperatorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("管理者画面"),
        centerTitle: true,
        actions: [
          FlatIconButton(
            onPressed: () {
              context.navigateNamedTo("settings");
            },
            icon: Icons.settings,
          ),
          // TODO: https://github.com/flutter/flutter/issues/118965
          const SizedBox(width: 16.0)
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
