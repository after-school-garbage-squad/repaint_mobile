import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';
import 'package:repaint_mobile/oss_licenses.dart';

@RoutePage()
class OssLicensesScreen extends StatelessWidget {
  static Future<List<Package>> loadLicenses() async {
    // merging non-dart dependency list using LicenseRegistry.
    final lm = <String, List<String>>{};
    await for (final l in LicenseRegistry.licenses) {
      for (final p in l.packages) {
        final lp = lm.putIfAbsent(p, () => []);
        lp.addAll(l.paragraphs.map((p) => p.text));
      }
    }
    final licenses = ossLicenses.toList();
    for (final key in lm.keys) {
      licenses.add(
        Package(
          name: key,
          description: '',
          authors: [],
          version: '',
          license: lm[key]!.join('\n\n'),
          isMarkdown: false,
          isSdk: false,
          isDirectDependency: false,
        ),
      );
    }
    return licenses..sort((a, b) => a.name.compareTo(b.name));
  }

  static final _licenses = loadLicenses();

  @override
  Widget build(BuildContext context) {
    return RepaintScaffold(
      title: "ライセンス",
      child: FutureBuilder<List<Package>>(
        future: _licenses,
        initialData: const [],
        builder: (context, snapshot) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final package = snapshot.data![index];
              return OperatorElevatedTile.license(
                title: "${package.name} ${package.version}",
                license: package.description,
                onTap: () => context.pushRoute(
                  OssLicensesDetailRoute(
                    license: package.license,
                    name: package.name,
                    version: package.version,
                    description: package.description,
                    homepage: package.homepage,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          );
        },
      ),
    );
  }
}
