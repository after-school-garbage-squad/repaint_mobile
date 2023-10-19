import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class IntroductionManualScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(introductionManualControllerProvider);
    final manualWebViewLoaded = ref.watch(manualWebViewStateProvider);
    final manualWebViewLoadedNotifier =
        ref.watch(manualWebViewStateProvider.notifier);
    final webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setBackgroundColor(Colors.transparent);

    webviewController
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            if (await Connectivity().checkConnectivity() ==
                ConnectivityResult.none) {
              manualWebViewLoadedNotifier.setError();
              await Future.delayed(const Duration(seconds: 2));
              await webviewController.reload();
            } else {
              manualWebViewLoadedNotifier.setLoaded();
            }
          },
          onWebResourceError: (error) {
            manualWebViewLoadedNotifier.setError();
          },
          onNavigationRequest: (request) {
            if (request.url == "https://repaint.asgs.dev/webview") {
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse('https://repaint.asgs.dev/webview'));

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    ref.listen(
      bluetoothServiceProvider,
      (previous, next) => showBluetoothErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    ref.listen(
      locationServiceProvider,
      (previous, next) => showLocationErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    return RepaintScaffold(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: manualWebViewLoaded == ManualWebViewStateEnum.loaded
                  ? WebViewWidget(controller: webviewController)
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          const SizedBox(height: 16.0),
          WideElevatedButton(
            disabled: manualWebViewLoaded != ManualWebViewStateEnum.loaded,
            onPressed: () => controller.onContinuePressed(context),
            text: "進む",
          ),
          const BottomPadding(),
        ],
      ),
    );
  }
}
