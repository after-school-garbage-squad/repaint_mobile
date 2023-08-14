import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/qrcode_reader_scaffold.dart';

@RoutePage()
class VisitorQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QRCodeReaderScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          children: [
            Text(
              'スポットのQRコードを読み込んでください',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
