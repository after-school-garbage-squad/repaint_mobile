import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class OssLicensesDetailScreen extends StatelessWidget {
  const OssLicensesDetailScreen({
    @queryParam this.license,
    @queryParam this.name = "",
    @queryParam this.version = "",
    @queryParam this.description = "",
    @queryParam this.homepage,
  });

  final String? license;
  final String name;
  final String version;
  final String description;
  final String? homepage;

  String _bodyText() {
    return license?.split('\n').map((line) {
          if (line.startsWith('//')) line = line.substring(2);
          return line.trim();
        }).join('\n') ??
        "";
  }

  @override
  Widget build(BuildContext context) {
    return RepaintScaffold(
      title: "$name $version",
      child: ColoredBox(
        color: Theme.of(context).canvasColor,
        child: ListView(
          children: <Widget>[
            if (description.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            if (homepage != null)
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: InkWell(
                  child: Text(
                    homepage!,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrlString(homepage!),
                ),
              ),
            if (description.isNotEmpty || homepage != null) const Divider(),
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
