import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/oss_licenses.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('ライセンス'),
      ),
      body: FutureBuilder<List<Package>>(
        future: _licenses,
        initialData: const [],
        builder: (context, snapshot) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final package = snapshot.data![index];
              return ListTile(
                title: Text('${package.name} ${package.version}'),
                subtitle: package.description.isNotEmpty
                    ? Text(package.description)
                    : null,
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MiscOssLicenseSingle(package: package),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}

class MiscOssLicenseSingle extends StatelessWidget {
  final Package package;

  const MiscOssLicenseSingle({required this.package});

  String _bodyText() {
    return package.license!.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      return line.trim();
    }).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${package.name} ${package.version}')),
      body: ColoredBox(
        color: Theme.of(context).canvasColor,
        child: ListView(
          children: <Widget>[
            if (package.description.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: Text(
                  package.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            if (package.homepage != null)
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: InkWell(
                  child: Text(
                    package.homepage!,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrlString(package.homepage!),
                ),
              ),
            if (package.description.isNotEmpty || package.homepage != null)
              const Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(
                _bodyText(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
